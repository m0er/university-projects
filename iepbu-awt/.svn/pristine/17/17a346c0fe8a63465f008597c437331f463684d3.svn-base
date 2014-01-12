package moer.iepbu;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IEPBU_Level1 extends IEPBU_Global implements ActionListener {	
	/* Level1 Containers */
	Panel level1_p1 = new Panel();
	private Panel level1_p2 = new Panel();
	private Panel level1_p3 = new Panel();	
	/* Level1 Global Components */
	private GridBagLayout gbl = new GridBagLayout();
	private GridBagConstraints gbc = new GridBagConstraints();
	private JButton[] global_btn_alphabet;	
	private JButton[] global_btn_number;
	private Panel global_panel_input = new Panel(gbl);	
	/* Level1 Components */
	private JLabel level1_label_logo = new JLabel("Integrated Estimated for", JLabel.CENTER);
	private ImageIcon bu_logo = new ImageIcon("bu_logo.jpg", "BU LOGO");
	private JLabel level1_image_logo = new JLabel(bu_logo);
	private Panel level1_panel_btn = new Panel(new FlowLayout(FlowLayout.CENTER, 0, 100));
	private JButton level1_btn_login = new JButton("로그인");
	/* Level1 Dialog Components */
	private Dialog level1_dialog = new Dialog(f, "로그인", true);
	private JButton level1_dialog_btn_student = new JButton("학생");
	private JButton level1_dialog_btn_general = new JButton("일반");
	private JButton level1_dialog_btn_faculty = new JButton("교직원");
	private JButton level1_dialog_btn_admin = new JButton("관리자");
	private JButton level1_btn_stuLogin = new JButton("일반 로그인");
	/* Level1 Login Components */
	private Panel level1_panel_general_center = new Panel();
	private JLabel level1_label_helpText = new JLabel("카드를 넣어주세요", JLabel.CENTER);
	private JLabel level1_image_card = new JLabel(new ImageIcon("swipe.jpg"));	
	private JLabel level1_label_loginID = new JLabel("아이디", JLabel.RIGHT);
	private TextField level1_tfield_loginID = new TextField(10);
	private TextField level1_tfield_loginPassword = new TextField(10);
	private JLabel level1_label_loginPassword = new JLabel("비밀번호", JLabel.RIGHT);
	private JButton level1_btn_connect = new JButton("접속");
	/* Level1 Variables */
	boolean whichField; // TRUE = ID, FALSE = PASSWORD
	// End of Level1 Components
	public IEPBU_Level1(Frame f) {
		super(f);
		this.assemble();
		f.add(level1_p1);
		f.setVisible(true);
	}
	public void assemble() {
		// Level1 Login Screen
		level1_p1.setLayout(new GridLayout(3,1));
		level1_p1.add(level1_label_logo);
		level1_label_logo.setFont(style_font_title);
		level1_p1.add(level1_image_logo);		
		level1_p1.add(level1_panel_btn);		
		level1_panel_btn.add(level1_btn_login);
		level1_btn_login.setFont(style_font_h2);
		level1_btn_login.setPreferredSize(new Dimension(150, 50));		
		level1_btn_login.addActionListener(this);
		// Level1 Dialog		
		level1_dialog.setSize(300,300);
		setPosition(level1_dialog);
		level1_dialog.setLocation(xpos, ypos);
		level1_dialog.setLayout(new GridLayout(4, 1));		
		level1_dialog.add(level1_dialog_btn_student);
		level1_dialog_btn_student.setFont(style_font_h4);
		level1_dialog.add(level1_dialog_btn_general);
		level1_dialog_btn_general.setFont(style_font_h4);
		level1_dialog.add(level1_dialog_btn_faculty);
		level1_dialog_btn_faculty.setFont(style_font_h4);
		level1_dialog.add(level1_dialog_btn_admin);
		level1_dialog_btn_admin.setFont(style_font_h4);
		level1_dialog_btn_student.addActionListener(this);
		level1_dialog_btn_general.addActionListener(this);
		level1_dialog_btn_faculty.addActionListener(this);
		level1_dialog_btn_admin.addActionListener(this);
		// Level1 Login - Student
		level1_p2.setLayout(null);
		level1_p2.add(level1_image_card);
		level1_image_card.setBounds(200, 50, 194, 483);
		level1_p2.add(level1_label_helpText);
		level1_label_helpText.setBounds(400, 50, 400, 483);		
		level1_label_helpText.setFont(style_font_h2);
		level1_p2.add(level1_btn_stuLogin);
		level1_btn_stuLogin.setFont(style_font_h3);
		level1_btn_stuLogin.setBounds(570, 490, 200, 50);
		level1_btn_stuLogin.addActionListener(this);				
		// Level1 Login - Default		
		level1_p3.setLayout(new GridLayout(2, 1));
		level1_p3.add(level1_panel_general_center);		
		level1_p3.setFont(style_font_h3);			
		// Level1 Login - Default - CENTER		
		gbc.gridx = 2; 	gbc.gridy = 2;
		gbl.setConstraints(level1_label_loginID, gbc);
		gbc.gridx = 3; 	gbc.gridy = 2;
		gbl.setConstraints(level1_tfield_loginID, gbc);
		level1_panel_general_center.setLayout(gbl);		
		gbc.gridx = 2;	gbc.gridy = 3;
		gbl.setConstraints(level1_label_loginPassword, gbc);
		gbc.gridx = 3;	gbc.gridy = 3;
		gbl.setConstraints(level1_tfield_loginPassword, gbc);
		gbc.gridx = 4; gbc.gridy = 3;
		gbl.setConstraints(level1_btn_connect, gbc);		
		level1_panel_general_center.add(level1_label_loginID);
		level1_panel_general_center.add(level1_tfield_loginID);
		level1_tfield_loginID.addFocusListener(new Keyboard());
		level1_panel_general_center.add(level1_label_loginPassword);
		level1_panel_general_center.add(level1_tfield_loginPassword);
		level1_tfield_loginPassword.addFocusListener(new Keyboard());
		level1_panel_general_center.add(level1_btn_connect);
		level1_btn_connect.setPreferredSize(new Dimension(100, 45));
		level1_btn_connect.setFont(style_font_h3);
		level1_label_loginID.setFont(style_font_h3);		
		level1_label_loginPassword.setFont(style_font_h3);
		level1_btn_connect.addActionListener(this);
		global_component();
		level1_p3.add("Center", global_panel_input);
		level1_check = true;		
	}	
	public void global_component() {
		global_btn_alphabet = new JButton[27]; // a-z, backspace
		global_btn_number = new JButton[10]; // 0-9
		String str = "a";
		int x=1, y=1;
		for (int i=0; i<global_btn_number.length; i++) {
			if (x > 10) {
				y++;
				x=1;
			}
			global_btn_number[i] = new JButton("" + i);
			gbc.gridx = x; 	gbc.gridy = y; gbc.weightx=1; gbc.fill = GridBagConstraints.BOTH;
			gbl.setConstraints(global_btn_number[i], gbc);
			global_btn_number[i].setFont(style_keyboard_num);
			global_btn_number[i].addActionListener(this);
			x++;
			global_panel_input.add(global_btn_number[i]);
		}
		for (int i=0; i<global_btn_alphabet.length; i++) {			
			if (x > 9) {
				y++;
				x=1;
			}
			if (i == 8) {
				global_btn_alphabet[i] = new JButton("DEL");				
			}
			else {
				global_btn_alphabet[i] = new JButton(str);
				str = Character.toString((char)(str.charAt(0) + 1));
			}
			if (i == 8 || i == 17 || i == 26)
				gbc.gridwidth=2;
			else
				gbc.gridwidth=1;
			gbc.gridx = x; 	gbc.gridy = y; gbc.weightx=1; gbc.weighty=1; gbc.fill = GridBagConstraints.BOTH;
			gbl.setConstraints(global_btn_alphabet[i], gbc);
			global_btn_alphabet[i].setFont(style_keyboard_alp);
			global_btn_alphabet[i].addActionListener(this);
			x++;
			global_panel_input.add(global_btn_alphabet[i]);
		}		
	}
	private class Keyboard extends FocusAdapter {
		public void focusGained(FocusEvent fe) {			
			if (fe.getSource().toString().indexOf("textfield0") > 0)
				whichField = true;
			else if(fe.getSource().toString().indexOf("textfield1") > 0)
				whichField = false;			
		}
	}
	public void actionPerformed(ActionEvent e) {		
		if (e.getSource() == level1_btn_login) {
			level1_dialog.setVisible(true);
		}
		else if (e.getSource() == ok) {
			popup.setVisible(false);
			popup.dispose();
		}
		else if (e.getSource() == level1_dialog_btn_general || e.getSource() == level1_dialog_btn_faculty
				|| e.getSource() == level1_btn_stuLogin || e.getSource() == level1_dialog_btn_admin
				|| e.getSource() == level1_dialog_btn_student) {
			level1_dialog.setVisible(false);
			level1_dialog.dispose();
			f.removeAll();
			if (e.getSource() == level1_dialog_btn_student) {				
				loginUser = 1;
				f.add(level1_p2);
				f.validate();
			}
			else if (e.getSource() == level1_dialog_btn_general || e.getSource() == level1_btn_stuLogin || e.getSource() == level1_dialog_btn_faculty) {
				if (e.getSource() == level1_dialog_btn_faculty)
					loginUser = 2;
				else if (e.getSource() == level1_btn_stuLogin)					
					loginUser = 1;				
				else if (e.getSource() == level1_dialog_btn_admin)
					loginUser = 0;
				else
					loginUser = 3; // general
				f.add(level1_p3);
			}
			f.validate();
		}
		else if (e.getSource() == level1_btn_connect) {			
			if (account[loginUser][1].equals(level1_tfield_loginID.getText())) {
				if (account[loginUser][2].equals(level1_tfield_loginPassword.getText())) {
					level1_tfield_loginPassword.setText("");
					level1_tfield_loginID.setText("");
					basket = new int[3][5]; // 새로운 바구니
					f.removeAll();
					IEPBU_Level2 level2 = new IEPBU_Level2(f);
					if(!level2_check)
						level2.assemble();					
					if(loginUser != 0) {
						f.add(level2.level2_p1);
						f.validate();
					}
					else {
						if(!admin_check)
							popUp(f, "미구현 입니다 :(");
							//adminAssemble();
						f.validate();
					}
				}
				else
					popUp(f, "패스워드가 틀렸습니다.");
			}
			else
				popUp(f, "아이디를 다시 확인해 주세요");	
		}
		else if (e.getActionCommand().length() <= 1) {
			if (whichField)
				level1_tfield_loginID.setText(level1_tfield_loginID.getText() + e.getActionCommand());	
			else {
				level1_tfield_loginPassword.setEchoChar('*');
				level1_tfield_loginPassword.setText(level1_tfield_loginPassword.getText() + e.getActionCommand());
			}
		}
		else if (e.getActionCommand().equals("DEL")) {
			char[] temp;
			if (whichField && level1_tfield_loginID.getText().length() > 0) {
				temp = level1_tfield_loginID.getText().toCharArray();
				temp[temp.length-1] = '\0';				
				level1_tfield_loginID.setText(String.valueOf(temp));
			}
			else if (!whichField && level1_tfield_loginPassword.getText().length() > 0) {
				temp = level1_tfield_loginPassword.getText().toCharArray();
				temp[temp.length-1] = '\0';				
				level1_tfield_loginPassword.setText(String.valueOf(temp));
			}
		}		
	}
}