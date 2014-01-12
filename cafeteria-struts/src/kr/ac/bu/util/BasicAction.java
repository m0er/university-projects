package kr.ac.bu.util;

import java.io.Reader;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public abstract class BasicAction extends Action {
	protected static Logger logger = Logger.getLogger(BasicAction.class);
	protected SqlMapClient client;
	
	public BasicAction() {
		try {
			String resource = "kr/ac/bu/config/sqlConfig.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			client = SqlMapClientBuilder.buildSqlMapClient(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		logger.info("Action Path: " + request.getRequestURI());
		
		return executeAction(mapping, form, request, response);
	}
	
	protected abstract ActionForward executeAction(ActionMapping mapping,
			ActionForm form, HttpServletRequest request, HttpServletResponse
			response) throws Exception;
}
