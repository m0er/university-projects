package com.moerog.util;

import java.io.Reader;

import org.apache.log4j.Logger;
import org.apache.struts.actions.EventDispatchAction;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.moerog.user.UserAction;

public class BasicEventDispatchAction extends EventDispatchAction {
	protected static Logger logger = Logger.getLogger(UserAction.class); 
	protected SqlMapClient client;
	
	public BasicEventDispatchAction() {
		try {
			String resource = "com/moerog/config/sqlConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			client = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
