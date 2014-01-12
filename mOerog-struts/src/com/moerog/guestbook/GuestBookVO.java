package com.moerog.guestbook;

import java.util.Date;

public class GuestBookVO {
	private long gbookId;
	private Date gbookDatetime;
	private String gbookContent;
	private String writer;
	
	public long getGbookId() {
		return gbookId;
	}
	public void setGbookId(long gbookId) {
		this.gbookId = gbookId;
	}
	public Date getGbookDatetime() {
		return gbookDatetime;
	}
	public void setGbookDatetime(Date gbookDatetime) {
		this.gbookDatetime = gbookDatetime;
	}
	public String getGbookContent() {
		return gbookContent;
	}
	public void setGbookContent(String gbookContent) {
		this.gbookContent = gbookContent;		
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
