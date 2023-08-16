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

package io.nosqlbench.datamappers.functions.to_cqlvector.from_number_list;

import com.datastax.oss.driver.api.core.data.CqlVector;
import io.nosqlbench.virtdata.api.annotations.Categories;
import io.nosqlbench.virtdata.api.annotations.Category;
import io.nosqlbench.virtdata.api.annotations.ThreadSafeMapper;

import java.util.List;
import java.util.function.Function;

@ThreadSafeMapper
@Categories(Category.experimental)
public class ToCqlVector implements Function<List, CqlVector> {

    @Override
    public CqlVector apply(List objects) {
        if (objects.size()==0) {
            throw new RuntimeException("Empty lists are not supported for vectors.");
        }
        return CqlVector.newInstance((List<Number>)objects);
    }
}
