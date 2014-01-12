package moer.moerog.module.comment;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/comment/")
public class CommentController {
	@Autowired CommentService commentService;
	Logger logger = LoggerFactory.getLogger(CommentController.class);
	
	@RequestMapping("add")
	public String add(@RequestParam int category, Comment comment) {
		logger.info("포스트 아이디: " + comment.getPostId());
		
		logger.info("카테고리: " + category);
		logger.info("커멘트 작성자: " + comment.getWriter());
		logger.info("커멘트 내용: " + comment.getContent());
		
		commentService.writeComment(comment);
		
		return "redirect:/post/list?category=" + category;
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam int category, Comment comment) {
		logger.info("포스트 아이디: " + comment.getPostId());
		logger.info("커멘트 아이디: " + comment.getId());
		logger.info("커멘트 작성자: " + comment.getWriter());
		
		commentService.deleteById(comment);
		
		return "redirect:/post/list?category=" + category;
	}
}
