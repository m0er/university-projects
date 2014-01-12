package moer.moerog.module.post;

import java.util.*;

import org.bson.types.ObjectId;

public interface PostService {

	List<Post> getListByCategoryId(int category);

	Long getTotalCount(int category);

	void writePost(Post post);

	void delete(Post post);

	Post getPostById(ObjectId postId);

	void modifyPost(Post post);

}
