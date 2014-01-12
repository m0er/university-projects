package moer.meetup.meeting;

import java.util.Date;

import moer.meetup.util.DateFormatUtil;


public class Meeting {
	private int id;
	private int limitAttendee;
	private int attendeeCount;
	private Date createDate;
	private Date openDate;
	private Date closeDate;
	private String open;
	private String title;
	private String close;
	private String owner;
	private String location;
	private String description;
	private boolean join;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getLimitAttendee() {
		return limitAttendee;
	}
	
	public void setLimitAttendee(int limitAttendee) {
		this.limitAttendee = limitAttendee;
	}
	
	public String getOwner() {
		return owner;
	}
	
	public void setOwner(String owner) {
		this.owner = owner;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getOpenDate() {
		return openDate;
	}

	public void setOpenDate(Date openDate) {
		this.openDate = openDate;
		this.open = DateFormatUtil.dateToString(this.openDate);
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getOpen() {
		return open;
	}
	
	public void setOpen(String open) {
		this.open = open;
		this.openDate = DateFormatUtil.stringToDate(open);
	}
	
	public String getClose() {
		return close;
	}
	
	public void setClose(String close) {
		this.close = close;
		this.closeDate = DateFormatUtil.stringToDate(close);
	}

	public int getAttendeeCount() {
		return attendeeCount;
	}

	public void setAttendeeCount(int attendeeCount) {
		this.attendeeCount = attendeeCount;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
		this.close = DateFormatUtil.dateToString(this.closeDate);
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isJoin() {
		return join;
	}

	public void setJoin(boolean join) {
		this.join = join;
	}
	
	@Override
	public String toString() {
		return "Meeting [id=" + id + ", limitAttendee=" + limitAttendee
				+ ", attendeeCount=" + attendeeCount + ", createDate="
				+ createDate + ", openDate=" + openDate + ", closeDate="
				+ closeDate + ", open=" + open + ", title=" + title
				+ ", close=" + close + ", owner=" + owner + ", location="
				+ location + ", description=" + description + ", join=" + join
				+ "]";
	}

}
