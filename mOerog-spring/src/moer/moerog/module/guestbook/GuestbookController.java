package moer.moerog.module.guestbook;

import moer.moerog.module.user.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/guestbook/")
@SessionAttributes("loginUser")
public class GuestbookController {
	@Autowired GuestbookService guestbookService;
	Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("guestbook", new Guestbook());
		model.addAttribute("list", guestbookService.getList());
		model.addAttribute("totalCount", guestbookService.getTotalCount());
		
		return "guestbook";
	}
	
	@RequestMapping("add")
	@Secured({"ROLE_USER"})
	public String form(Guestbook guestbook) {
		logger.info(guestbook.getWriter());
		
		guestbookService.addGuestbook(guestbook);
		
		return "redirect:/guestbook/list";
	}
	
	@RequestMapping("delete")
	public String delete(Guestbook guestbook) {
		logger.info("삭제할 방명록 ID: " + guestbook.getId());	
		
		guestbookService.delete(guestbook);
		
		return "redirect:/guestbook/list";
	}
	
}
