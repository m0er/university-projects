package com.moerog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.RequestProcessor;

public class BasicRequestProcessor extends RequestProcessor {
	
	@Override
	protected boolean processPreprocess(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return super.processPreprocess(request, response);
	}
}
