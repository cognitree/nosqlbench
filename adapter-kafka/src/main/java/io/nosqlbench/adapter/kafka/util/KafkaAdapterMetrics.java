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

package io.nosqlbench.adapter.kafka.util;

import com.codahale.metrics.Counter;
import com.codahale.metrics.Histogram;
import com.codahale.metrics.Timer;
import io.nosqlbench.adapter.kafka.dispensers.KafkaBaseOpDispenser;
import io.nosqlbench.nb.api.labels.NBLabeledElement;
import io.nosqlbench.nb.api.labels.NBLabels;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class KafkaAdapterMetrics {

    private static final Logger logger = LogManager.getLogger("S4JAdapterMetrics");
    private final NBLabels labels;

    private Histogram messageSizeHistogram;
    private Timer bindTimer;
    private Timer executeTimer;
    // - message out of sequence error counter
    private Counter msgErrOutOfSeqCounter;
    // - message loss counter
    private Counter msgErrLossCounter;
    // - message duplicate error counter
    private Counter msgErrDuplicateCounter;

    public Histogram getE2eMsgProcLatencyHistogram() {
        return this.e2eMsgProcLatencyHistogram;
    }

    // end-to-end latency
    private Histogram e2eMsgProcLatencyHistogram;
    private final KafkaBaseOpDispenser kafkaBaseOpDispenser;

    public KafkaAdapterMetrics(final KafkaBaseOpDispenser kafkaBaseOpDispenser, final NBLabeledElement labeledParent) {
        this.kafkaBaseOpDispenser = kafkaBaseOpDispenser;
        labels=labeledParent.getLabels().and("name",KafkaAdapterMetrics.class.getSimpleName());
    }

    public void initS4JAdapterInstrumentation() {
        // Histogram metrics
        messageSizeHistogram = kafkaBaseOpDispenser.create().histogram("message_size");

        // Timer metrics
        bindTimer =
            this.kafkaBaseOpDispenser.create().timer(
                    "bind");
        executeTimer =
            this.kafkaBaseOpDispenser.create().timer(
                     "execute");

        // End-to-end metrics
        // Latency
        e2eMsgProcLatencyHistogram =
            kafkaBaseOpDispenser.create().histogram("e2e_msg_latency");
        // Error metrics
        msgErrOutOfSeqCounter =
            kafkaBaseOpDispenser.create().counter("err_msg_oos");
        msgErrLossCounter =
            kafkaBaseOpDispenser.create().counter("err_msg_loss");
        msgErrDuplicateCounter =
            kafkaBaseOpDispenser.create().counter( "err_msg_dup");
    }

    public Timer getBindTimer() { return bindTimer; }
    public Timer getExecuteTimer() { return executeTimer; }
    public Histogram getMessagesizeHistogram() { return messageSizeHistogram; }

    public Counter getMsgErrOutOfSeqCounter() {
        return msgErrOutOfSeqCounter;
    }

    public void setMsgErrOutOfSeqCounter(Counter msgErrOutOfSeqCounter) {
        this.msgErrOutOfSeqCounter = msgErrOutOfSeqCounter;
    }

    public Counter getMsgErrLossCounter() {
        return msgErrLossCounter;
    }

    public void setMsgErrLossCounter(Counter msgErrLossCounter) {
        this.msgErrLossCounter = msgErrLossCounter;
    }

    public Counter getMsgErrDuplicateCounter() {
        return msgErrDuplicateCounter;
    }

    public void setMsgErrDuplicateCounter(Counter msgErrDuplicateCounter) {
        this.msgErrDuplicateCounter = msgErrDuplicateCounter;
    }
}
