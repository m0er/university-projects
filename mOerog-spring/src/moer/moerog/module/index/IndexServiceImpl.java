package moer.moerog.module.index;

import java.util.*;

import moer.moerog.module.comment.Comment;
import moer.moerog.module.comment.CommentService;
import moer.moerog.module.post.*;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("indexService")
public class IndexServiceImpl implements IndexService {
	@Autowired PostService postService;
	@Autowired CommentService commentService;
	
	@Override
	public void setPostLIstTo(Index index) {
		for (Category category : Category.values()) {
			index.getPostMap().put(category.name(), postService.getListByCategoryId(category.getCategory()));
			index.getPostCount().put(category.name(), postService.getTotalCount(category.getCategory()));
		}
	}
	
	@Override
	public Map<ObjectId, List<Comment>> getCommentMap(Map<String, List<Post>> postMap) {
		Map<ObjectId, List<Comment>> commentMap = new HashMap<>();
		
		for (Category category : Category.values()) {
			for (Post post : postMap.get(category.name())) {
				ObjectId postId = post.getId();
				commentMap.put(postId, commentService.getListByPostId(postId));
			}
		}
		
		return commentMap;
	}
}
