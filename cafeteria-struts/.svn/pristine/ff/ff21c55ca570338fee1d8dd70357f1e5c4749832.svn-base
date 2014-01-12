package kr.ac.bu.plex;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ReservationVO {
	private int id;
	private String clientID;
	private String menuID;	
	private String name;
	private String department;
	private String title;
	private String dateForm;
	private Date reserveDate;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClientID() {
		return clientID;
	}
	public void setClientID(String clientID) {
		this.clientID = clientID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(reserveDate.getTime());
		DateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		this.dateForm = form.format(reserveDate);
	}
	public String getDateForm() {
		return dateForm;
	}
	public String getMenuID() {
		return menuID;
	}
	public void setMenuID(String menuID) {
		this.menuID = menuID;
	}
}
