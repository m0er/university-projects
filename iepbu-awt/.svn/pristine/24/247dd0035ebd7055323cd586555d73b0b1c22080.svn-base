package moer.iepbu;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IEPBU_Level2 extends IEPBU_Global {	
	/* Level2 Components */
	Panel level2_p1 = new Panel();
	Panel level2_p2 = new Panel();
	/* Level2 - Item Selection */
	private TextArea level2_textarea_notify1 = new TextArea("전체 공지사항", 10, 50, TextArea.SCROLLBARS_NONE);
	private TextArea level2_textarea_notify2 = new TextArea("학과 공지사항", 10, 50, TextArea.SCROLLBARS_NONE);
	private ImageIcon level2_foodTicket = new ImageIcon("food.jpg", "식권");
	private ImageIcon level2_busTicket = new ImageIcon("bus.jpg", "버스표");	
	private JButton level2_btn_food = new JButton(level2_foodTicket);
	private JButton level2_btn_bus = new JButton(level2_busTicket);
	/* Level2 - Building Selection */
	private ImageIcon level2_campusMap = new ImageIcon("campus_map.jpg", "Campus Map");	
	private JLabel level2_label_mapWrapper = new JLabel(level2_campusMap);
	private JLabel level2_label_header = new JLabel("건물을 선택하세요");
	private JLabel level2_building_bonbu = new JLabel();
	private JLabel level2_building_faculty = new JLabel();
	private JLabel level2_building_bokji = new JLabel();
	private JLabel level2_bonbu_popup = new JLabel(new ImageIcon("bonbu_popup.png"));
	private JLabel level2_bokji_popup = new JLabel(new ImageIcon("bokji_popup.png"));
	private JLabel level2_faculty_popup = new JLabel(new ImageIcon("faculty_popup.png"));	
	// End of Level2 Components
	public IEPBU_Level2(Frame f) {
		super(f);		
	}
	public void assemble() {		
		/* Level2 Default */
		level2_p1.setLayout(new GridLayout(2,2));
		level2_textarea_notify1.setEditable(false);
		level2_textarea_notify2.setEditable(false);				
		level2_p1.add(level2_btn_food);
		backStep[0] = new JButton(new ImageIcon("backArrow.jpg"));
		backStep[1] = new JButton(new ImageIcon("backArrow.jpg"));		
		backStep[0].setBackground(Color.white);
		backStep[1].setBackground(Color.white);		
		/* Level2 - Select Content Screen */
		level2_btn_food.addMouseListener(new MouseHandler());	
		level2_p1.add(level2_textarea_notify1);
		level2_p1.add(level2_textarea_notify2);
		level2_p1.add(level2_btn_bus);		
		level2_btn_bus.addMouseListener(new MouseHandler());
		/* Level2 - Select Building Screen */
		level2_p2.setLayout(null);
		level2_p2.addMouseListener(new MouseHandler());
		level2_p2.add(backStep[1]);
		backStep[1].addMouseListener(new MouseHandler());
		level2_p2.add(level2_label_header);
		level2_p2.add(level2_building_bonbu);
		level2_p2.add(level2_bonbu_popup);
		level2_p2.add(level2_building_faculty);
		level2_p2.add(level2_faculty_popup);
		level2_p2.add(level2_building_bokji);
		level2_p2.add(level2_bokji_popup);
		level2_p2.add(level2_label_mapWrapper);
		/* Level2 - Campus Map(CM) */
		level2_label_mapWrapper.setBounds(0, 0, 800, 600);
		level2_label_header.setBounds(250, 0, 400, 60);
		level2_label_header.setFont(style_font_h1);
		level2_label_header.setBackground(Color.white);
		backStep[1].setBounds(0, 0, 100, 70);
		/* Level2 - CM - Bonbu */
		level2_building_bonbu.setBounds(275, 151, 142, 55);
		level2_building_bonbu.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));		
		level2_building_bonbu.addMouseListener(new MouseHandler());
		/* Level2 - CM - Bonbu - Popup */
		level2_bonbu_popup.setBounds(275, 79, 123, 72);
		level2_bonbu_popup.setVisible(false);
		/* Level2 - CM - Faculty */
		level2_building_faculty.setBounds(300, 240, 37, 20);
		level2_building_faculty.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		level2_building_faculty.addMouseListener(new MouseHandler());
		/* Level2 - CM - Faculty - Popup */
		level2_faculty_popup.setBounds(301, 167, 123, 72);
		level2_faculty_popup.setVisible(false);
		/* Level2 - CM - Bokji */
		level2_building_bokji.setBounds(180, 340, 56, 50);
		level2_building_bokji.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		level2_building_bokji.addMouseListener(new MouseHandler());
		/* Level2 - CM - Bokji - Popup */
		level2_bokji_popup.setBounds(180, 268, 123, 72);
		level2_bokji_popup.setVisible(false);
		level2_check = true;
	}
	private class MouseHandler extends MouseAdapter {
		public void mouseClicked(MouseEvent me) {
			//System.out.println("X: " + me.getX());
			//System.out.println("Y: " + me.getY());			
			if (me.getSource() == level2_btn_food) {
				f.removeAll();
				f.add(level2_p2);
				f.validate();
			}
			else if (me.getSource() == backStep[0] || me.getSource() == backStep[1]) {				
				f.removeAll();
				f.add(level2_p1);
				f.validate();												
			}
			else if (me.getSource() == level2_btn_bus)
				popUp(f, "미구현 입니다 :(");
			else if (me.getSource() == level2_building_bonbu) {				
				f.removeAll();
				IEPBU_Level3 level3 = new IEPBU_Level3(f);
				if (!level3_bonbu_check)
					level3.assemble();
				selected = 0; // 본부동
				level3.setMenu();
				f.add(level3.level3_p1);
				f.validate();
			}
			else if (me.getSource() == level2_building_faculty) {
				f.removeAll();
				IEPBU_Level3 level3 = new IEPBU_Level3(f);
				if (!level3_bonbu_check)
					level3.assemble();
				selected = 1; // 교수회관
				level3.setMenu();
				f.add(level3.level3_p1);
				f.validate();
			}
			else if (me.getSource() == level2_building_bokji) {
				f.removeAll();
				IEPBU_Level3 level3 = new IEPBU_Level3(f);
				if (!level3_bonbu_check)
					level3.assemble();
				selected = 2; // 복지동
				level3.setMenu();
				f.add(level3.level3_p1);
				f.validate();
			}
		}
		public void mouseEntered(MouseEvent me) {
			if (me.getSource() == level2_building_bonbu) {
				level2_bonbu_popup.setVisible(true);
			}
			else if (me.getSource() == level2_building_bokji) {
				level2_bokji_popup.setVisible(true);
			}
			else if (me.getSource() == level2_building_faculty) {
				level2_faculty_popup.setVisible(true);
			}
		}
		public void mouseExited(MouseEvent me) {
			if (me.getSource() == level2_building_bonbu) {
				level2_bonbu_popup.setVisible(false);
			}
			else if (me.getSource() == level2_building_bokji) {
				level2_bokji_popup.setVisible(false);				
			}
			else if (me.getSource() == level2_building_faculty) {
				level2_faculty_popup.setVisible(false);
			}
		}
	}
}