/*
 * Copyright (c) nosqlbench
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

package io.nosqlbench.virtdata.library.curves4.discrete.common;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class ThreadSafeHashTest {

    @Test
    public void testExtremeValues() {
        ThreadSafeHash threadSafeHash = new ThreadSafeHash();
        long part =Long.MAX_VALUE >> 4; // 1/16 of positive long domain
        for (long i = 0; i < 20; i++) {
            //long v = Math.multiplyExact(i,part);
            long v = i*part & Long.MAX_VALUE;
            assertThat(v).isNotNegative();
            assertThat(threadSafeHash.applyAsLong(v)).isNotNegative();
        }
    }
}
