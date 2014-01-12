package moer.moerog.module.comment;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Comment {
	private ObjectId id;
	private Date created;
	private String content;
	private ObjectId postId;
	private String writer;

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public ObjectId getId() {
		return id;
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

	public ObjectId getPostId() {
		return postId;
	}

	public void setPostId(ObjectId postId) {
		this.postId = postId;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", created=" + created + ", content="
				+ content + ", postId=" + postId + ", writer=" + writer + "]";
	}
}
