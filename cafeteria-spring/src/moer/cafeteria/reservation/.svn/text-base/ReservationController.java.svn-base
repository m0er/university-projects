package moer.cafeteria.reservation;

import java.util.*;

import javax.servlet.http.*;

import moer.cafeteria.rate.*;
import moer.cafeteria.user.*;
import moer.cafeteria.util.DateFormatUtil;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("reservation")
@SessionAttributes("login")
public class ReservationController {
	@Autowired ReservationService reservationService;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/{building}")
	public String index(@PathVariable String building, Model model) {
		logger.info("selected building: " + building);
		model.addAttribute("building", building);
		
		Reservation reservation = createReservation(building);
		List<Reservation> reservationList = reservationService.getReservationListByBuilding(reservation);
		
		if (reservationList != null) {
			logger.info(reservationList.toString());
			
			List<Reservation> lunchReservationList = new ArrayList<Reservation>();
			List<Reservation> normalReservationList = new ArrayList<Reservation>();
			for (Reservation element : reservationList) {
				if (element.getType().equals("LUNCH"))
					lunchReservationList.add(element);
				else
					normalReservationList.add(element);
			}
			
			model.addAttribute("lunchReservationList", lunchReservationList);
			model.addAttribute("lunchReservationListSize", lunchReservationList.size());
			model.addAttribute("normalReservationList", normalReservationList);
			model.addAttribute("normalReservationListSize", normalReservationList.size());
		}
		
		final String originalBuildingName = BuildingType.valueOf(building.toUpperCase()).toString();
		logger.info("original building name: " + originalBuildingName);
		model.addAttribute("originalBuildingName", originalBuildingName);
		
		return "reservation/main";
	}

	private Reservation createReservation(String building) {
		Reservation reservation = new Reservation();
		reservation.setBuilding(building);
		return reservation;
	}
	
	@RequestMapping("/menu/add")
	public String addMenu(Menu menu, @RequestParam String provideString, Model model) {
		logger.info("provide date: " + provideString);
		menu.setProvide(DateFormatUtil.stringToDate(provideString));
		logger.info(menu.toString());
		reservationService.addMenu(menu);
		String building = menu.getBuilding();
		return "redirect:/reservation/" + building;
	}
	
	@RequestMapping(value="/searchmenu/location/{building}/date/{searchDate}", method=RequestMethod.GET)
	@ResponseBody
	public List<Menu> getMenu(@PathVariable String building, @PathVariable String searchDate) {
		logger.info("building: " + building);
		logger.info("search date: " + searchDate);
		
		Menu menu = createMenu(building, searchDate);
		final List<Menu> menuList = reservationService.getMenuList(menu);
		logger.info(menuList.toString());
		return menuList;
	}
	
	@RequestMapping(value="/rate/{menuId}", method=RequestMethod.GET)
	@ResponseBody
	public RateDto getRate(@PathVariable int menuId) {
		logger.info("menu id for rateList: " + menuId);
		if (menuId == 0) return null;
		return reservationService.getRate(menuId);
	}

	private Menu createMenu(String building, String searchDate) {
		Menu menu = new Menu();
		menu.setBuilding(building);
		menu.setProvide(DateFormatUtil.stringToDate(searchDate));
		return menu;
	}
	
	@RequestMapping("/register")
	public String register(final Reservation reservation, @RequestParam String date, HttpSession session) {
		logger.info(reservation.toString());
		logger.info("select date: " + date);
		
		User currentUser = currentUser(session);
		logger.info(currentUser.toString());
		
		reservation.setReserveDate(DateFormatUtil.stringToDate(date));
		reservation.setClientId(currentUser.getId());
		reservationService.registerReservation(reservation);
		return "redirect:/reservation/" + reservation.getBuilding();
	}
	
	private User currentUser(HttpSession session) {
		return (User) session.getAttribute("login");
	}
	
	@RequestMapping(value="/confirm/id/{id}", method=RequestMethod.GET)
	@ResponseBody
	public boolean confirmRegister(@PathVariable int id) {
		logger.info("confirm reservation id: " + id);
		reservationService.confirmReservation(id);
		return true;
	}
	
	@RequestMapping(value="/cancel/id/{id}", method=RequestMethod.GET)
	@ResponseBody
	public boolean cancelRegister(@PathVariable int id) {
		logger.info("cancel reservation id: " + id);
		reservationService.cancelReservation(id);
		return true;
	}
	
	@RequestMapping(value="/rate", method=RequestMethod.POST)
	public String rate(Rate rate, @ModelAttribute("login") User currentUser) {
		rate.setUserId(currentUser.getId());
		logger.info("user rate: " + rate);
		logger.info("current user: " + currentUser);
		
		reservationService.addRate(rate);
		return "redirect:/reservation/" + rate.getBuilding();
	}
	
	@RequestMapping("/comment/{building}")
	public String comment(@PathVariable String building, Model model) {
		final Date today = new Date();
		Menu menu = createMenu(building, DateFormatUtil.dateToString(today));
		final String originalBuildingName = BuildingType.valueOf(building.toUpperCase()).toString();
		model.addAttribute("menuList", reservationService.getMenuList(menu));
		model.addAttribute("originalBuildingName", originalBuildingName);
		return "reservation/comment";
	}
	
}
