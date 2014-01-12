package com.moerog.guestbook;

import java.util.List;

public class GuestBookTO {
	private List<GuestBookVO> list;
	private long totalCount;

	public List<GuestBookVO> getList() {
		return list;
	}
	public void setList(List<GuestBookVO> list) {
		this.list = list;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
}
