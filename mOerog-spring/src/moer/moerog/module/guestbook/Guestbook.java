package moer.moerog.module.guestbook;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Guestbook {
	private ObjectId id;
	private Date created;
	private String content;
	private String writer;

	public ObjectId getId() {
		return id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setId(ObjectId id) {
		this.id = id;
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

	@Override
	public String toString() {
		return "Guestbook [id=" + id + ", created=" + created + ", content="
				+ content + ", writer=" + writer + "]";
	}
}
