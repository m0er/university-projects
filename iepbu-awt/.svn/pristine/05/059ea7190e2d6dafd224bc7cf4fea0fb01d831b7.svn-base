package moer.iepbu;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class IEPBU_MainHandler {
	Frame f = new Frame("IEPBU");
	IEPBU_Level1 level1;	
	public IEPBU_MainHandler() {		
		ImageIcon icon = new ImageIcon("bu_icon.png");
		f.setIconImage(icon.getImage());
		f.setBackground(Color.white);	
		f.addWindowListener(new WindowHandler());
		f.setSize(800, 600);
		f.setResizable(false);
		IEPBU_Global global = new IEPBU_Global(f);
		global.setPosition(f);
		f.setLocation(global.xpos, global.ypos);
		level1 = new IEPBU_Level1(f);
	}
	class WindowHandler extends WindowAdapter {
		public void windowClosing(WindowEvent e) {
			e.getWindow().setVisible(false);
			e.getWindow().dispose();
			System.exit(0);
		}
	}			
	public static void main(String[] args) {
		new IEPBU_MainHandler();
	}
}