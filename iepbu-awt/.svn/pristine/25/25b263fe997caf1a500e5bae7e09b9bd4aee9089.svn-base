package moer.iepbu;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class IEPBU_Level3 extends IEPBU_Global implements ActionListener {	
	/* Level3 Components */
	Panel level3_p1 = new Panel();	
	/* Level3 Dialog Basket */
	private Dialog level3_dialog_basket;
	private Panel level3_dialog_sub = new Panel(new GridLayout(2,1)); 
	private JButton level3_dgbtn_ok;
	private JButton level3_dgbtn_cancel;
	private JButton level3_btn_upper = new JButton(new ImageIcon("upperArrow_dialog.png"));
	private JButton level3_btn_lower = new JButton(new ImageIcon("lowerArrow_dialog.png"));
	private JTextField level3_tf_dialog = new JTextField("0", 5);
	/* Level3 Menu Selection */
	private JLabel level3_label_header = new JLabel("오늘의 메뉴!", JLabel.CENTER);
	private JLabel level3_label_price = new JLabel("가격:");
	private JLabel[] level3_menu_price = new JLabel[5];
	private TextArea[] level3_menu_details = new TextArea[5];
	private JButton[] level3_menu_select = new JButton[5];	
	private JButton level3_btn_basket = new JButton(new ImageIcon("shopping_basket.jpg"));	
	/* Level3 In Shoppong Basket*/
	private Panel level3_inBasket = new Panel();
	private JButton level3_inBasket_submit = new JButton("결재");	
	private JLabel level3_inBasket_header = new JLabel("구매내역", JLabel.CENTER);	
	/* Level3 Submit */
	private Dialog level3_dialog_submit;
	private Panel level3_submit_sub = new Panel(new FlowLayout(FlowLayout.CENTER));
	private JLabel level3_submit_helpText1 = new JLabel("", JLabel.CENTER);
	private JLabel level3_submit_helpText2 = new JLabel("", JLabel.CENTER);
	private JButton level3_btn_end = new JButton("확인");	
	/* Level3 Variables */	
	private int level3_dialog_select = 0;
	// End of Level3 Components
	public IEPBU_Level3(Frame f) {
		super(f);
	}
	public void assemble() {	
		level3_p1.setLayout(null);
		backStep[2] = new JButton(new ImageIcon("backArrow.jpg"));
		backStep[3] = new JButton(new ImageIcon("backArrow.jpg"));
		backStep[2].setBackground(Color.white);
		backStep[3].setBackground(Color.white);
		backStep[2].setBounds(0, 0, 100, 70);
		backStep[2].addMouseListener(new MouseHandler());
		level3_p1.add(backStep[2]);	
		level3_p1.add(level3_label_header);
		level3_label_header.setBounds(150, 0, 450, 60);
		level3_label_header.setFont(style_font_h1);
		level3_label_header.setBackground(Color.white);
		level3_btn_basket.setBounds(700, 0, 83, 73);
		level3_btn_basket.addMouseListener(new MouseHandler());
		level3_p1.add(level3_label_price);
		level3_p1.add(level3_btn_basket);		
		level3_label_price.setBounds(0, 130, 100, 30);
		level3_label_price.setVerticalAlignment(JLabel.BOTTOM);
		level3_label_price.setFont(style_font_h2);		
		level3_menu_price[0] = new JLabel("3000", JLabel.CENTER);
		level3_menu_price[0].setBounds(0, 100, 160, 100);
		level3_menu_price[0].setVerticalAlignment(JLabel.BOTTOM);
		level3_menu_price[1] = new JLabel("2600", JLabel.CENTER);
		level3_menu_price[1].setBounds(160, 100, 160, 100);
		level3_menu_price[1].setVerticalAlignment(JLabel.BOTTOM);
		level3_menu_price[2] = new JLabel("2300", JLabel.CENTER);
		level3_menu_price[2].setBounds(320, 100, 160, 100);
		level3_menu_price[2].setVerticalAlignment(JLabel.BOTTOM);
		level3_menu_price[3] = new JLabel("2000", JLabel.CENTER);
		level3_menu_price[3].setBounds(480, 100, 160, 100);
		level3_menu_price[3].setVerticalAlignment(JLabel.BOTTOM);
		level3_menu_price[4] = new JLabel("1700", JLabel.CENTER);
		level3_menu_price[4].setBounds(640, 100, 160, 100);
		level3_menu_price[4].setVerticalAlignment(JLabel.BOTTOM);
		level3_menu_price[0].setFont(style_font_h3);
		level3_menu_price[1].setFont(style_font_h3);
		level3_menu_price[2].setFont(style_font_h3);
		level3_menu_price[3].setFont(style_font_h3);
		level3_menu_price[4].setFont(style_font_h3);
		level3_p1.add(level3_menu_price[0]);
		level3_p1.add(level3_menu_price[1]);
		level3_p1.add(level3_menu_price[2]);
		level3_p1.add(level3_menu_price[3]);
		level3_p1.add(level3_menu_price[4]);
		level3_menu_details[0] = new TextArea("", 10, 20, TextArea.SCROLLBARS_NONE);
		level3_menu_details[0].setBounds(0, 200, 160, 200);
		level3_menu_details[0].setEditable(false);		
		level3_menu_details[1] = new TextArea("", 10, 20, TextArea.SCROLLBARS_NONE);
		level3_menu_details[1].setBounds(160, 200, 160, 200);
		level3_menu_details[1].setEditable(false);
		level3_menu_details[2] = new TextArea("", 10, 20, TextArea.SCROLLBARS_NONE);
		level3_menu_details[2].setBounds(320, 200, 160, 200);
		level3_menu_details[2].setEditable(false);
		level3_menu_details[3] = new TextArea("", 10, 20, TextArea.SCROLLBARS_NONE);
		level3_menu_details[3].setBounds(480, 200, 160, 200);
		level3_menu_details[3].setEditable(false);
		level3_menu_details[4] = new TextArea("", 10, 20, TextArea.SCROLLBARS_NONE);
		level3_menu_details[4].setBounds(640, 200, 160, 200);
		level3_menu_details[4].setEditable(false);
		level3_p1.add(level3_menu_details[0]);
		level3_p1.add(level3_menu_details[1]);
		level3_p1.add(level3_menu_details[2]);
		level3_p1.add(level3_menu_details[3]);
		level3_p1.add(level3_menu_details[4]);		
		level3_menu_select[0] = new JButton("선택");
		level3_menu_select[1] = new JButton("선택");
		level3_menu_select[2] = new JButton("선택");
		level3_menu_select[3] = new JButton("선택");
		level3_menu_select[4] = new JButton("선택");		
		level3_menu_select[0].setBounds(0, 400, 160, 70);
		level3_menu_select[0].setFont(style_font_h2);
		level3_menu_select[0].addActionListener(this);
		level3_p1.add(level3_menu_select[0]);		
		level3_menu_select[1].setBounds(160, 400, 160, 70);
		level3_menu_select[1].setFont(style_font_h2);
		level3_menu_select[1].addActionListener(this);
		level3_p1.add(level3_menu_select[1]);		
		level3_menu_select[2].setBounds(320, 400, 160, 70);
		level3_menu_select[2].setFont(style_font_h2);
		level3_menu_select[2].addActionListener(this);
		level3_p1.add(level3_menu_select[2]);		
		level3_menu_select[3].setBounds(480, 400, 160, 70);
		level3_menu_select[3].setFont(style_font_h2);
		level3_menu_select[3].addActionListener(this);
		level3_p1.add(level3_menu_select[3]);		
		level3_menu_select[4].setBounds(640, 400, 160, 70);
		level3_menu_select[4].setFont(style_font_h2);
		level3_menu_select[4].addActionListener(this);
		level3_p1.add(level3_menu_select[4]);
		level3_bonbu_check = true;
		/* Level3 - In Shopping Basket */
		level3_inBasket.setLayout(null);
		level3_inBasket.add(backStep[3]);
		backStep[3].setBounds(0, 0, 100, 70);
		backStep[3].addMouseListener(new MouseHandler());
		level3_inBasket.add(level3_inBasket_header);
		level3_inBasket_header.setBounds(150, 0, 450, 60);
		level3_inBasket_header.setFont(style_font_h1);		
		level3_inBasket.add(level3_inBasket_receipt);
		level3_inBasket_receipt.setBounds(100, 100, 600, 400);
		level3_inBasket_receipt.setEditable(false);
		level3_inBasket_receipt.setFont(style_font_h4);		
		level3_inBasket.add(level3_inBasket_submit);
		level3_inBasket_submit.setFont(style_font_h2);
		level3_inBasket_submit.setBounds(600, 510, 100, 50);
		level3_inBasket_submit.addActionListener(this);
	}
	public void level3_dialog_basket() {
		Font level3_font_h3 = new Font ("SansSerif", Font.PLAIN, 28);
		level3_dialog_basket = new Dialog(f, "장바구니", true);		
		level3_dialog_basket.setSize(200,200);
		setPosition(level3_dialog_basket);
		level3_dialog_basket.setLocation(xpos, ypos);
		level3_dialog_basket.setLayout(new GridLayout(3, 3));
		level3_dialog_basket.add(new Panel());
		level3_dialog_basket.add(level3_btn_upper);		
		level3_dialog_basket.add(new Panel());
		level3_dialog_basket.add(new Panel());
		level3_dialog_basket.add(level3_tf_dialog);
		level3_tf_dialog.setFont(level3_font_h3);
		level3_tf_dialog.setHorizontalAlignment(JTextField.RIGHT);
		level3_dialog_basket.add(level3_dialog_sub);	
		level3_dgbtn_ok = new JButton("확인");
		level3_dgbtn_cancel = new JButton("취소");
		level3_btn_upper.addMouseListener(new MouseHandler());
		level3_btn_lower.addMouseListener(new MouseHandler());		
		level3_dialog_sub.add(level3_dgbtn_ok);
		level3_dialog_sub.add(level3_dgbtn_cancel);
		level3_dgbtn_cancel.addActionListener(this);
		level3_dgbtn_ok.addActionListener(this);
		level3_dialog_basket.add(new Panel());
		level3_dialog_basket.add(level3_btn_lower);
		level3_dialog_basket.add(new Panel());
		level3_dialog_basket.setResizable(false);
		level3_dialog_check = true;
	}
	public void level3_dialog_submit() {
		level3_dialog_submit = new Dialog(f, "결재 창", true);
		level3_dialog_submit.setSize(400, 400);
		level3_dialog_submit.setResizable(false);
		setPosition(level3_dialog_submit);
		level3_dialog_submit.setLocation(xpos, ypos);
		level3_dialog_submit.setLayout(new GridLayout(4,1));
		level3_dialog_submit.add(new Panel());
		level3_dialog_submit.add(level3_submit_helpText1);
		level3_dialog_submit.add(level3_submit_helpText2);
		level3_submit_helpText1.setFont(style_font_h2);		
		level3_submit_helpText2.setFont(style_font_h2);		
		level3_dialog_submit.add(level3_submit_sub);
		level3_submit_sub.add(level3_btn_end);
		level3_btn_end.setFont(style_font_h3);
		level3_btn_end.setPreferredSize(new Dimension(100, 50));
		level3_btn_end.addActionListener(this);
		level3_submit_check = true;
	}
	public void setMenu() {
		for (int i=0; i<level3_menu_details.length; i++) {
			level3_menu_details[i].setText(menu[selected][i]);
			if (menu[selected][i] == "-")
				level3_menu_select[i].setEnabled(false);			
			else
				level3_menu_select[i].setEnabled(true);
		}
	}
	public void getReceipt() {
		String temp = "";		
		level3_inBasket_receipt.append("---------------------------\n");
		level3_inBasket_receipt.append("구매처 \t수량 \t금액\n");
		level3_inBasket_receipt.append("---------------------------\n");
		for (int i=0; i<basket.length; i++) {
			for (int j=0; j<basket[0].length; j++) {
				if (basket[i][j] > 0) {
					switch(i) {
					case 0: temp = "본부동"; break;
					case 1: temp = "교수회관"; break;
					case 2: temp = "복지동"; break;
					}
					level3_inBasket_receipt.append(temp + "\t" + basket[i][j] + "\t" + Integer.parseInt(level3_menu_price[j].getText()) + "\n");
					total += Integer.parseInt(level3_menu_price[j].getText()) * basket[i][j];					
				}
			}
		}
		level3_inBasket_receipt.append("---------------------------\n");
		level3_inBasket_receipt.append("합  계:\t\t" + total + "\n");
		level3_inBasket_receipt.append("---------------------------\n");		
	}
	private class MouseHandler extends MouseAdapter {
		public void mouseClicked(MouseEvent me) {
			if (me.getSource() == level3_btn_basket) {
				f.removeAll();
				f.add(level3_inBasket);
				getReceipt();
				f.validate();
			}			
			else if (me.getSource() == level3_btn_upper) {			
				level3_tf_dialog.setText(String.valueOf(Integer.parseInt(level3_tf_dialog.getText()) + 1));				
			}
			else if (me.getSource() == level3_btn_lower) {				
				if (Integer.parseInt(level3_tf_dialog.getText()) > 0) {
					level3_tf_dialog.setText(String.valueOf(Integer.parseInt(level3_tf_dialog.getText()) - 1));					
				}
			}
			else if (me.getSource() == backStep[2]) {
				f.removeAll();
				IEPBU_Level2 level2 = new IEPBU_Level2(f);
				level2.assemble();
				f.add(level2.level2_p2);				
				f.validate();
			}
			else if (me.getSource() == backStep[3]) {
				f.removeAll();
				total = 0;
				level3_inBasket_receipt.setText("");
				f.add(level3_p1);
				f.validate();
			}
		}
	}
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == level3_dgbtn_ok) {			
			basket[selected][level3_dialog_select] = Integer.parseInt(level3_tf_dialog.getText());			
			level3_dialog_basket.setVisible(false);
			level3_dialog_basket.dispose();
		}
		else if (e.getSource() == level3_dgbtn_cancel) {			
			level3_dialog_basket.setVisible(false);	
			level3_dialog_basket.dispose();
		}
		else if (e.getSource() == level3_menu_select[0] || e.getSource() == level3_menu_select[1] ||
				e.getSource() == level3_menu_select[2] || e.getSource() == level3_menu_select[3] ||
				e.getSource() == level3_menu_select[4]) {			
			if(e.getSource() == level3_menu_select[0]) {				
				level3_dialog_select = 0;				
			}
			else if (e.getSource() == level3_menu_select[1]) {				
				level3_dialog_select = 1;				
			}
			else if (e.getSource() == level3_menu_select[2]) {
				level3_dialog_select = 2;
			}
			else if (e.getSource() == level3_menu_select[3]) {
				level3_dialog_select = 3;
			}
			else if (e.getSource() == level3_menu_select[4]) {
				level3_dialog_select = 4;
			}			
			if (!level3_dialog_check)
				level3_dialog_basket();
			level3_tf_dialog.setText(String.valueOf(basket[selected][level3_dialog_select]));
			level3_dialog_basket.setVisible(true);
		}
		else if (e.getSource() == level3_inBasket_submit) {
			int total = 0;
			if(!level3_submit_check)
				level3_dialog_submit();			
			for (int i=0; i<basket.length; i++) {
				for (int j=0; j<basket[0].length; j++) {
					total += basket[i][j] * Integer.parseInt(level3_menu_price[j].getText());
				}
			}
			if(Integer.parseInt(account[loginUser][4]) >= total) {				
				account[loginUser][4] = String.valueOf(Integer.parseInt(account[loginUser][4]) - total);
				level3_submit_helpText1.setText("결재가 완료되었습니다!");
				level3_submit_helpText2.setText("잔액은" + account[loginUser][4] + "원 입니다 :D");	
			}
			else if (total == 0) {
				level3_submit_helpText1.setText("선택한 식권이 없습니다!");
				level3_submit_helpText2.setText("다시 확인해 주세요 :S");
			}
			else {
				level3_submit_helpText1.setText("잔액이 부족합니다!");
				level3_submit_helpText2.setText("다음에 이용해 주세요 :(");
			}
			level3_dialog_submit.setVisible(true);
		}
		else if (e.getSource() == level3_btn_end) {			
			level3_inBasket_receipt.setText("");			
			level3_dialog_submit.setVisible(false);
			level3_dialog_submit.dispose();
			f.removeAll();
			IEPBU_Level1 level1 = new IEPBU_Level1(f);
			f.add(level1.level1_p1);
		}
	}
}