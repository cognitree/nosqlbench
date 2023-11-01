/*
 * Copyright (c) 2023 nosqlbench
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package io.nosqlbench.scenarios.simframe.stats;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;
import java.util.function.DoubleSupplier;

public class StabilityDetector implements Runnable {
    private final static Logger logger = LogManager.getLogger(StabilityDetector.class);
    private final double timeSliceSeconds;
    private final double threshold;
    private final DoubleSupplier source;
    private StatBucket[] buckets;
    private int[] windows;
    private volatile boolean running = true;

    /**
     * Configure a stability checker that reads values from a source on some timed loop,
     * computes the streaming standard deviation, computes the ratio of stabilization between
     * values from longer windows to shorter windows, and returns from its run method once
     * the computed ratio is higher than the min threshold.
     *
     * @param timeSliceSeconds
     *     How frequently to gather a sample. 0.1 is recommended to start
     * @param minThreshold
     *     The unit interval fractional stability measurement which must be met at a minimum in order to stop polling
     *     for stability
     * @param source
     *     The source of data to be added to the streaming std dev computations
     * @param windows
     *     The size of each window in the set of diminishing sizes. These contain the last N samples by size,
     *     respectively.
     */
    public StabilityDetector(double timeSliceSeconds, double minThreshold, DoubleSupplier source, int... windows) {
        if (windows.length < 2) {
            throw new RuntimeException("you must provide at least to summarization windows, ordered in decreasing size.");
        }
        this.timeSliceSeconds = timeSliceSeconds;
        this.threshold = minThreshold;
        this.source = source;
        this.windows = windows;
        for (int i = 0; i < windows.length - 1; i++) {
            if (windows[i] < windows[i + 1]) {
                throw new RuntimeException("windows must be provided in descending size, but you specified " + List.of(windows));
            }
        }

    }

    private void reset() {
        this.buckets = new StatBucket[windows.length];
        for (int i = 0; i < windows.length; i++) {
            buckets[i] = new StatBucket(windows[i]);
        }
    }

    public double apply(double value) {
        for (StatBucket bucket : buckets) {
            bucket.apply(value);
        }
        return computeStability();
    }

    private boolean primed() {
        for (StatBucket bucket : buckets) {
            if (!bucket.primed()) {
                return false;
            }
        }
        return true;
    }

    private double computeStability() {
        if (!primed()) {
            return -1.0d;
        }
        double[] stddev = new double[buckets.length];
        for (int i = 0; i < buckets.length; i++) {
            stddev[i] = buckets[i].stddev();
        }
        double basis = 1.0d;

        for (int i = 0; i < buckets.length - 1; i++) {
            double reductionFactor = stddev[i] / stddev[i + 1];
            basis *= reductionFactor;
        }
        System.out.printf("STABILITY %g :", basis);
        for (int i = 0; i < stddev.length; i++) {
            System.out.printf("[%d]: %g ", windows[i], stddev[i]);
        }
        System.out.println();
//        logger.info("STABILITY " + basis);


        return basis;

    }

    /**
     * This run method is meant to be reused, since it resets internal state each time
     */
    @Override
    public void run() {
        int interval = (int) this.timeSliceSeconds / 1000;
        reset();

        boolean steadyEnough = false;
        long lastCheck = System.currentTimeMillis();
        long nextCheckAt = lastCheck + interval;

        while (running && !steadyEnough) {
            long delay = nextCheckAt - System.currentTimeMillis();
            while (delay > 0) {
                try {
                    Thread.sleep(delay);
                } catch (InterruptedException ignored) {
                }
                delay = nextCheckAt - System.currentTimeMillis();
            }
            double value = source.getAsDouble();
            apply(value);
            double stabilityFactor = computeStability();
            if (stabilityFactor > threshold) {
                return;
            }
        }
    }


}
