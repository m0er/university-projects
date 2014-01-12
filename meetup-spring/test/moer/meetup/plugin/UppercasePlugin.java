package moer.meetup.plugin;

import java.sql.*;
import java.util.*;

import org.apache.ibatis.executor.resultset.*;
import org.apache.ibatis.plugin.*;

@Intercepts({@Signature(
		type=ResultSetHandler.class,
		method="handleResultSets",
		args={Statement.class})})
public class UppercasePlugin implements Interceptor {
	
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		invocation.getTarget().toString();
		
		return invocation.proceed();
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
	}

}
