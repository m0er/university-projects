package moer.iepbu;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IEPBU_Global implements ActionListener {
	Frame f;
	/* Style */	
	Font style_font_title = new Font("Serif", Font.BOLD, 30);
	Font style_font_h1 = new Font ("SansSerif", Font.BOLD, 35);	
	Font style_font_h2 = new Font ("SansSerif", Font.BOLD, 30);
	Font style_font_h3 = new Font ("SansSerif", Font.PLAIN, 28);
	Font style_font_h4 = new Font ("SansSerif", Font.PLAIN, 20);
	Font style_keyboard_num = new Font("SansSerif", Font.BOLD, 25);
	Font style_keyboard_alp = new Font("Monospaced", Font.BOLD, 25);
	private Dimension d, fd;
	int xpos, ypos;	
	/* Level1 Variables */
	static int loginUser; // 0:관리자, 1:학생, 2:교직원, 3:일반
	static String[][] account = {{"0", "admin", "1234"},{"1", "20046326", "test", "최윤석", "30000"},
								{"2", "1234567", "test", "교수", "5000"}, {"3", "testuser", "test", "일반회원", "5000"}};		
	boolean level1_check = false;
	boolean admin_check = false;
	/* popUp Components */
	Dialog popup;
	JButton ok;
	/* Level2 Variables */
	boolean level2_check = false;	
	JButton[] backStep = new JButton[4];	
	/* Level3 Variables */
	static int total; // 총 금액
	static int[][] basket = new int[3][5]; // 0:본부 1:교수회관 2:복지동
	static int selected; // 0:본부 1:교수회관 2:복지동
	boolean level3_dialog_check = false;
	boolean level3_bonbu_check = false;
	boolean level3_submit_check = false;	
	TextArea level3_inBasket_receipt = new TextArea();
	String[][] menu = {{"제육김치덮밥","치킨까스\n\n백반정식-어묵탕, 볼튀김, 감자햄조림, 김치","-","오므라이스","잔치국수"},
			{"뚝배기정식","콤비셋트","치킨가스","광동식탕수육","-"},
			{"-","피자돈가스\n\n치즈샌드돈가스\n\n돈갈비떡찜","불고기낙지볶음\n\n소고기국밥","비빔밥","-"}};	
	public IEPBU_Global(Frame f) {
		this.f = f;
	}	
	public void setPosition(Component f) {
		d = Toolkit.getDefaultToolkit().getScreenSize();
		fd = f.getSize();
		xpos = (int)(d.width / 2 - fd.width / 2);
		ypos = (int)(d.height /2 - fd.height / 2);		
	}
	public void popUp(Frame f, String help_text) {
		popup = new Dialog(f, "알림", true);
		Toolkit.getDefaultToolkit().beep();
		Panel temp = new Panel(new FlowLayout(FlowLayout.CENTER));
		popup.setLayout(new GridLayout(2,1));		
		popup.setSize(180, 120);
		setPosition(popup);
		popup.setLocation(xpos, ypos);
		ok = new JButton("확인");
		ok.setName("popup_btn");
		ok.addActionListener(this);
		popup.add(new JLabel(help_text, JLabel.CENTER));
		popup.add(temp);
		temp.add(ok);
		popup.setResizable(false);
		popup.setVisible(true);
	}	
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == ok) {
			popup.setVisible(false);
			popup.dispose();
		}
	}
}