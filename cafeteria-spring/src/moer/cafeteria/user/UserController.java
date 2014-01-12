package moer.cafeteria.user;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.*;

@Controller
@RequestMapping("user")
@SessionAttributes("login")
public class UserController {
	@Autowired UserService userService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/login")
	public String login(User user, Model model) {
		logger.info(user.toString());
		User loginUser = userService.login(user);
		model.addAttribute("login", loginUser);
		return "redirect:/index";
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/index";
	}
}
