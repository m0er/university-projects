package moer.moerog.module.comment;

import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	@Autowired private CommentRepository commentRepository;
	
	@Override
	public void writeComment(Comment comment) {
		commentRepository.save(comment);
	}

	@Override
	public List<Comment> getListByPostId(ObjectId postId) {
		return commentRepository.findByPostId(postId);
	}

	@Override
	public void deleteById(Comment comment) {
		commentRepository.delete(comment);
	}

}
