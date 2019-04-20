package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	// private DatabaseCommand database = new
	// DatabaseCommand("org.gjt.mm.mysql.Driver",
	// "jdbc:mysql://localhost:3306/resume_control?useSSL=false","root",
	// "123456");
	private Conn database;
	private String user;
	private String password;
	private String clientUser;
	private String clientPassword;

	public User() {
		this.database = new Conn();
	}

	/**
	 * 验证登录信息
	 * @param username 用户输入的用户名
	 * @param password 用户输入的密码
	 * @return 用户名和密码是否验证成功
	 */
	public boolean isLogin(String username, String password) {
		for (;;) {
			ResultSet rs = database.selectCommand("SELECT user,password FROM users.");
			try {
				rs.next();
				this.user = rs.getString("user");
				this.password = rs.getString("password");
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if ("".equals(username) || "".equals(password)) {
				return false;
			} else {
				if (username.equals(user) && password.equals(password)) {
					return true;
				} else {
					return false;
				}
			}
		}
	}
}
