package command;

import java.sql.*;

public class LoginCommand {
	// private DatabaseCommand database = new
	// DatabaseCommand("org.gjt.mm.mysql.Driver",
	// "jdbc:mysql://localhost:3306/resume_control?useSSL=false","root",
	// "CSY-love");
	private DatabaseCommand database;
	private String user;
	private String password;
	private String clientUser;
	private String clientPassword;

	public LoginCommand() {
		this.database = new DatabaseCommand();
	}

	/* 账号密码验证 */
	public boolean isLogin(String clientUser, String clientPassword) {
		for (;;) {
			ResultSet rs = database.selectCommand("SELECT user,password FROM users.");
			try {
				rs.next();
				this.user = rs.getString("user");
				this.password = rs.getString("password");
			}catch(SQLException e) {
				e.printStackTrace();
			}
			if ("".equals(clientUser) || "".equals(clientPassword)) {
				return false;
			} else {
				if (clientUser.equals(user) && clientPassword.equals(password)) {
					return true;
				} else {
					return false;
				}
			}
		}
	}
}
