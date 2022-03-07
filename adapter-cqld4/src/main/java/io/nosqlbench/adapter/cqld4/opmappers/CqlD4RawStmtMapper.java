package io.nosqlbench.adapter.cqld4.opmappers;

import com.datastax.oss.driver.api.core.CqlSession;
import io.nosqlbench.adapter.cqld4.opdispensers.Cqld4RawStmtDispenser;
import io.nosqlbench.adapter.cqld4.optypes.Cqld4CqlOp;
import io.nosqlbench.engine.api.activityimpl.OpDispenser;
import io.nosqlbench.engine.api.activityimpl.OpMapper;
import io.nosqlbench.engine.api.templating.ParsedOp;

import java.util.function.LongFunction;

public class CqlD4RawStmtMapper implements OpMapper<Cqld4CqlOp> {

    private final LongFunction<CqlSession> sessionFunc;
    private final LongFunction<String> targetFunction;

    public CqlD4RawStmtMapper(LongFunction<CqlSession> sessionFunc, LongFunction<String> targetFunction) {
        this.sessionFunc = sessionFunc;
        this.targetFunction = targetFunction;
    }

    @Override
    public OpDispenser<? extends Cqld4CqlOp> apply(ParsedOp cmd) {
        return new Cqld4RawStmtDispenser(sessionFunc, targetFunction, cmd);
    }
}
