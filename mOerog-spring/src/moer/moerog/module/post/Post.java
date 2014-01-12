package moer.moerog.module.post;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Post {
	private ObjectId id;
	private Integer category;
	private String title;
	private Date created;
	private String content;
	private String adminNickname;

	public ObjectId getId() {
		return id;
	}

	public void setId(ObjectId id) {
		this.id = id;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAdminNickname() {
		return adminNickname;
	}

	public void setAdminNickname(String adminNickname) {
		this.adminNickname = adminNickname;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", category=" + category + ", title=" + title
				+ ", created=" + created + ", content=" + content
				+ ", adminNickname=" + adminNickname + "]";
	}
}
