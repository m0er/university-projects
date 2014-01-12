package moer.moerog.module.post;

import java.util.*;

import moer.moerog.module.comment.Comment;
import moer.moerog.module.comment.CommentService;
import moer.moerog.module.user.User;

import org.bson.types.ObjectId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/post/")
@SessionAttributes("loginUser")
public class PostController {
	@Autowired PostService postService;
	@Autowired CommentService commentService;
	Logger logger = LoggerFactory.getLogger(PostController.class);
	
	@RequestMapping("list")
	public String list(Comment comment, @RequestParam int category, @ModelAttribute User loginUser, Model model) {
		logger.info("카테고리: " + category);
		
		model.addAttribute("postList", postService.getListByCategoryId(category));
		model.addAttribute("totalCount", postService.getTotalCount(category));
		
		addComment(model);
		
		return Category.values()[category - 1].name();
	}
	
	@SuppressWarnings("unchecked")
	private void addComment(Model model) {
		Map<ObjectId, List<Comment>> commentMap = new HashMap<>();
		for (Post post : (List<Post>) model.asMap().get("postList")) {
			ObjectId postId = post.getId();
			commentMap.put(postId, commentService.getListByPostId(postId));
		}
		model.addAttribute("commentMap", commentMap);
	}

	@RequestMapping("form")
	public String form(Model model) {
		model.addAttribute("post", new Post());
		model.addAttribute("user", new User());
		return "writepost";
	}
	
	@RequestMapping("modifyForm")
	public String modifyForm(Post post, Model model) {
		logger.info("수정할 포스트 아이디: " + post.getId());
		logger.info("수정할 포스트 카테고리: " + post.getCategory());
		logger.info("수정할 포스트 닉네임: " + post.getAdminNickname());
		post = postService.getPostById(post.getId());
		
		logger.info("수정할 포스트 타이틀: " + post.getTitle());
		logger.info("수정할 포스트 컨텐츠: " + post.getContent());
		
		model.addAttribute("post", post);
		return "modifypost";
	}
	
	@RequestMapping("write")
	public String write(Post post) {
		if (post == null) return "redirect:/post/esl"; 
		logger.info("카테고리: " + post.getCategory());
		logger.info("제목: " + post.getTitle());
		logger.info("닉네임: " + post.getAdminNickname());
		
		postService.writePost(post);
		return "redirect:/post/list?category=" + post.getCategory();
	}
	
	@RequestMapping("delete")
	public String delete(Post post) {
		logger.info("포스트 아이디: " + post.getId());
		logger.info("카테고리: " + post.getCategory());
		logger.info("닉네임: " + post.getAdminNickname());
		postService.delete(post);
		return "redirect:/post/list?category=" + post.getCategory();
	}
	
	@RequestMapping("modify")
	public String modify(Post post) {
		logger.info("포스트 아이디: " + post.getId());
		logger.info("카테고리: " + post.getCategory());
		logger.info("닉네임: " + post.getAdminNickname());
		logger.info("타이틀: " + post.getTitle());
		logger.info("컨텐츠: " + post.getContent());
		
		postService.modifyPost(post);
		return "redirect:/post/list?category=" + post.getCategory();
	}
}
