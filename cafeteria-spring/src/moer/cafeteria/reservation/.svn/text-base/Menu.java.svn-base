package moer.cafeteria.reservation;

import java.util.*;

import moer.cafeteria.util.DateFormatUtil;

public class Menu {
	private int id;
	private int price;
	private String title;
	private String building;
	private Date provide;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getBuilding() {
		return building;
	}
	
	public void setBuilding(String building) {
		this.building = building;
	}
	
	public String getProvide() {
		return DateFormatUtil.dateToString(provide);
	}
	
	public void setProvide(Date provide) {
		this.provide = provide;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", price=" + price + ", title=" + title
				+ ", building=" + building + ", provide=" + getProvide() + "]";
	}
}
