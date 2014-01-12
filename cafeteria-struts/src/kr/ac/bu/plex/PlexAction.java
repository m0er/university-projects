package kr.ac.bu.plex;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.bu.util.BasicEventDispatchAction;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.LazyValidatorForm;

public class PlexAction extends BasicEventDispatchAction {
	private enum Buildings {
		BONBU {
			public String toString() {
				return "본부동";
			}
		},
		
		BOKJI {
			public String toString() {
				return "복지동";
			}
		},
		
		PROF {
			public String toString() {
				return "교수회관";
			}
		};
	}
	
	/**
	 * 예약 현황 리스트를 출력한다
	 */
	@SuppressWarnings("unchecked")
	public ActionForward list(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.list() called");
		
		@SuppressWarnings("rawtypes")
		Enumeration names = request.getSession().getAttributeNames();
		String building = "";
		
		for (String name; names.hasMoreElements(); ) {
			name = (String)names.nextElement();
			
			if (name.equals("building")) {
				logger.info("선택된 건물: " + request.getSession().getAttribute("building"));
				building = (String)request.getSession().getAttribute("building");
				building = Buildings.valueOf(building.toUpperCase()).toString();
				logger.info("Enum process: " + building);
				
				request.setAttribute("building", building);
			}
		}
		
		if (request.getSession().getAttribute("user") != null) {
			Map<String, String> map = new HashMap<String, String>();
			DateFormat dateForm = new SimpleDateFormat("yyyy-MM-dd");
			String date = dateForm.format(new Date());
			
			logger.info(date);
			
			map.put("reserveDate", date);
			map.put("building", building);
			
			List<ReservationVO> vos = client.queryForList("plex.getReservations", map);
			
			if (vos.size() > 0) {
				request.setAttribute("reservations", vos);
			}
			
			logger.info("예약 리스트 가져오기 성공!");
		}
		
		return mapping.findForward("plex");
	}
	
	@SuppressWarnings("unchecked")
	public ActionForward searchMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.searchMenu() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		
		logger.info("선택된 건물: " + lazyForm.get("building"));
		
		Map<String, String> map = new HashMap<String, String>();
		String searchDate = (String)lazyForm.get("searchDate");
		map.put("searchDate", searchDate);
		map.put("building", (String)lazyForm.get("building"));
		
		List<MenuVO> vos = client.queryForList("plex.getMenu", map);
		
		logger.info(vos);
		
		request.setAttribute("searchDate", searchDate);
		request.setAttribute("menu", vos);
		
		return list(mapping, form, request, response);
	}
	
	/**
	 * 고객 // 예약 처리 메소드
	 */
	public ActionForward reserve(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.reserve() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		ReservationVO vo = new ReservationVO();
		BeanUtils.copyProperties(vo, lazyForm);
		
		// searchDate 파라미터 넘어오지 않음. 아마 EL 값이 actino form 이외에는 연동이 안되는 듯.
		logger.info(request.getParameter("searchDate"));
		logger.info(lazyForm.get("searchDate"));
		
		vo.setReserveDate(provideDateParse(lazyForm.get("searchDate").
				toString()));
		
		logger.info(vo.getClientID() + ", " + vo.getMenuID() + ", " +
				vo.getType() + ", " + vo.getReserveDate());
		
		client.insert("plex.setReservation", vo);
		
		return list(mapping, form, request, response);
	}
	
	/**
	 * 운영자 // 음식 메뉴 등록 메소드
	 */
	public ActionForward registerMenu(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.registerMenu() called");
		logger.info("building: " + request.getParameter("building"));
		logger.info("building: " + request.getAttribute("building"));
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;		
		MenuVO vo = new MenuVO();
		
		logger.info("lazyForm building: " + lazyForm.get("building"));
		String selectedBuilding = (String)lazyForm.get("building");
		
		selectedBuilding = Buildings.valueOf(selectedBuilding.toUpperCase()).toString();
		
		logger.info("선택한 빌딩: " + selectedBuilding);
		
		vo.setBuilding(selectedBuilding);
		vo.setPrice(Integer.parseInt(request.getParameter("price")));
		vo.setTitle(request.getParameter("title"));
		vo.setProvideDate(provideDateParse(request.getParameter(
				"provideDateAlt")));
		
		logger.info(vo.getTitle() + ", " + vo.getPrice() + ", " +
				vo.getBuilding() + ", " + vo.getProvideDate());
		
		client.insert("plex.setMenu", vo);
		
		return list(mapping, form, request, response);
	}
	
	/**
	 * LazyValidator 폼 사용시 VO와 매핑해야 하기 때문에, 스트링으로 받아서
	 * 파싱해야 함.
	 */
	private Date provideDateParse(String provideDateAlt) {
		System.out.println("Setter Method: " + provideDateAlt);
		String[] date = provideDateAlt.split("-");
		Calendar cal = Calendar.getInstance();		
		cal.set(Integer.parseInt(date[0]), Integer.parseInt(date[1]) - 1,
				Integer.parseInt(date[2]));
		
		return cal.getTime();
	}
	
	/**
	 * 운영자 // 음식 판매 메소드
	 */
	public ActionForward sell(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.sell() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		logger.info("Reservation ID: " + lazyForm.get("id"));		
		int id = Integer.parseInt((String)lazyForm.get("id"));
		
		client.delete("plex.deleteReservation", id);
		
		logger.info("음식 판매 성공!");
		
		return list(mapping, form, request, response);
	}
	
	public ActionForward cancel(ActionMapping mapping, ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("plex.cancel() called");
		
		LazyValidatorForm lazyForm = (LazyValidatorForm)form;
		logger.info("Reservation ID: " + lazyForm.get("id"));
		int id = Integer.parseInt((String)lazyForm.get("id"));
		
		client.delete("plex.deleteReservation", id);
		
		logger.info("예약 취소 성공!");
		
		return list(mapping, form, request, response);
	}
}
