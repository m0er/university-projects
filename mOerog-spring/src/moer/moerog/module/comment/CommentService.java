package moer.moerog.module.comment;

import java.util.List;

import org.bson.types.ObjectId;

public interface CommentService {

	void writeComment(Comment comment);
	
	List<Comment> getListByPostId(ObjectId postId);

	void deleteById(Comment comment);
}
