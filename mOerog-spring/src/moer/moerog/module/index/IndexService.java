package moer.moerog.module.index;

import java.util.List;
import java.util.Map;

import org.bson.types.ObjectId;

import moer.moerog.module.comment.Comment;
import moer.moerog.module.post.Post;

public interface IndexService {

	void setPostLIstTo(Index index);

	Map<ObjectId, List<Comment>> getCommentMap(Map<String, List<Post>> postMap);

}
