package moer.moerog.module.comment;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CommentRepository extends MongoRepository<Comment, ObjectId>{

	List<Comment> findByPostId(ObjectId postId);

}
