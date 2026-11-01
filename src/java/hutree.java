import java.awt.*;
import java.sql.*;
import java.util.*;

import javax.swing.*;
import javax.swing.tree.*;

public class hutree extends JFrame {

	Connection con = null;

	Statement st = null;

	ResultSet rs = null;

	public static void main(String args[]) throws Exception {
		new hutree();
	}

	public hutree() throws Exception {

		super("Retrieving data from database ");

		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/";
		String db = "purchases";

		ArrayList list = new ArrayList();
		list.add("Purchases");

		Class.forName(driver);
		con = DriverManager.getConnection(url + db, "root", "root");

		try {
			String sql = "SELECT UNAME,PNAME,TOTAL, NPRODUCT,SELLING,(TOTAL-(SELLING*NPRODUCT)) FROM PURCHASE GROUP BY PNAME,uname";

			st = con.createStatement();
			rs = st.executeQuery(sql);

			while (rs.next()) {
				Object value[] = { rs.getString(1), rs.getString(2),
						rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6)};
				list.add(value);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		rs.close();
		st.close();
		con.close();

		Object hierarchy[] = list.toArray();

		JFrame frame = new JFrame();
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Container content = getContentPane();

		DefaultMutableTreeNode root = processHierarchy(hierarchy);
		JTree tree = new JTree(root);
		content.add(new JScrollPane(tree), BorderLayout.CENTER);
		setSize(275, 300);
		setLocation(300, 100);
		setVisible(true);

	}

	private DefaultMutableTreeNode processHierarchy(Object[] hierarchy) {
		DefaultMutableTreeNode node = new DefaultMutableTreeNode(hierarchy[0]);
		DefaultMutableTreeNode child;
		for (int i = 1; i < hierarchy.length; i++) {
			Object nodeSpecifier = hierarchy[i];
			if (nodeSpecifier instanceof Object[]) // Ie node with children
			{
				child = processHierarchy((Object[]) nodeSpecifier);
			} else {
				child = new DefaultMutableTreeNode(nodeSpecifier); // Ie Leaf

			}
			node.add(child);
		}
		return (node);
	}
}
