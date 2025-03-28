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

package io.nosqlbench.adapter.http.core;

import io.nosqlbench.adapter.http.HttpDriverAdapter;
import io.nosqlbench.adapters.api.activityimpl.OpDispenser;
import io.nosqlbench.adapters.api.activityimpl.OpMapper;
import io.nosqlbench.adapters.api.activityimpl.uniform.DriverAdapter;
import io.nosqlbench.adapters.api.templating.ParsedOp;
import io.nosqlbench.nb.api.components.core.NBComponent;
import io.nosqlbench.nb.api.config.standard.NBConfiguration;

import java.util.function.LongFunction;

public class HttpOpMapper implements OpMapper<HttpOp,HttpSpace> {

    private final NBConfiguration cfg;
    private final DriverAdapter adapter;

    public HttpOpMapper(HttpDriverAdapter adapter, NBConfiguration cfg) {
        this.cfg = cfg;
        this.adapter = adapter;
    }

    @Override
    public OpDispenser<HttpOp> apply(NBComponent adapterC, ParsedOp op, LongFunction<HttpSpace> spaceF) {
        LongFunction<String> spaceNameF = op.getAsFunctionOr("space", "default");
        return new HttpOpDispenser(adapter, spaceF, op);
    }
}
