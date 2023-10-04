/*
 * Copyright (c) 2022-2023 nosqlbench
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

package io.nosqlbench.engine.core.lifecycle.activity;

import io.nosqlbench.engine.core.lifecycle.scenario.context.ActivitiesController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class ActivitiesExceptionHandler implements Thread.UncaughtExceptionHandler {

    private static final Logger logger = LogManager.getLogger(ActivitiesExceptionHandler.class);

    private final ActivitiesController controller;

    public ActivitiesExceptionHandler(ActivitiesController controller) {
        this.controller = controller;
        logger.debug(() -> "Activities exception handler starting up for executor '" + this.controller + "'");
    }


    @Override
    public void uncaughtException(Thread t, Throwable e) {
        logger.error("Uncaught exception in thread '" + t.getName() + ", state[" + t.getState() + "], notifying executor '" + controller + "'");
        controller.notifyException(t, e);
    }
}
