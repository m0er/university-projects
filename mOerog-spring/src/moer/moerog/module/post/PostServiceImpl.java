package moer.moerog.module.post;

import java.util.*;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.*;

@Service("postService")
public class PostServiceImpl implements PostService {
	@Autowired private PostRepository postRepository;
	@Autowired private MongoTemplate mongoTemplate;
	
	@Override
	public List<Post> getListByCategoryId(int category) {
		return postRepository.findByCategory(category);
	}

	@Override
	public Long getTotalCount(int category) {
		return mongoTemplate.count(Query.query(Criteria.where("category").is(category)), Post.class);
	}

	@Override
	public void writePost(Post post) {
		postRepository.save(post);
	}

	@Override
	public void delete(Post post) {
		postRepository.delete(post);
	}

	@Override
	public Post getPostById(ObjectId postId) {
		return postRepository.findOne(postId);
	}

	@Override
	public void modifyPost(Post post) {
		if (post.getId() == null)
			throw new IllegalArgumentException("postId가 필요합니다.");
		postRepository.save(post);
	}

}
