package moer.cafeteria.reservation;

import java.util.*;

import moer.cafeteria.util.DateFormatUtil;

public class Reservation {
	private int id;
	private String clientId;
	private int menuId;
	private Date reserveDate;
	private String type;
	private String building;
	private String name;
	private String department;
	private String title;
	private boolean confirmed;
	private boolean rated;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getClientId() {
		return clientId;
	}
	
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	
	public int getMenuId() {
		return menuId;
	}
	
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	
	public String getReserveDate() {
		return DateFormatUtil.dateToString(reserveDate);
	}
	
	public void setReserveDate(Date reserveDate) {
		this.reserveDate = reserveDate;
	}
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
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

	public boolean isConfirmed() {
		return confirmed;
	}

	public void setConfirmed(boolean confirmed) {
		this.confirmed = confirmed;
	}

	public boolean isRated() {
		return rated;
	}

	public void setRated(boolean rated) {
		this.rated = rated;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", clientId=" + clientId + ", menuId="
				+ menuId + ", reserveDate=" + reserveDate + ", type=" + type
				+ ", building=" + building + ", name=" + name + ", department="
				+ department + ", title=" + title + ", confirmed=" + confirmed
				+ ", rated=" + rated + "]";
	}

}