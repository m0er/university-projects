package moer.meetup.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

@Controller
@RequestMapping("user")
@SessionAttributes("login")
public class UserController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired UserService userService;
	
	@RequestMapping("/login")
	public String login(User user, Model model) {
		logger.info(user.toString());
		
		if (userService.verify(user)) {
			model.addAttribute("login", user);
			return "redirect:/meeting/list";
		} else {
			return "redirect:/index";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/index";
	}
	
	@RequestMapping("/add")
	public String add(User user) {
		logger.info(user.toString());
		userService.register(user);
		return "redirect:/index";
	}
}
