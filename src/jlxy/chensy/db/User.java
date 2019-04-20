package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
	private Conn conn;
	private String extra;

	public String getExtra() {
		return extra;
	}

	public User() {
		this.conn = new Conn();
	}

	/**
	 * 验证登录信息
	 * 修改extra，存放额外信息
	 * @param username 用户输入的用户名
	 * @param password 用户输入的密码
	 * @return 用户名和密码是否验证成功
	 */
	public boolean login(String username, String password) {
		if (username == null || "".equals(username)) {
			extra = "请输入用户名。";
			return false;
		}
		if (password == null || "".equals(password)) {
			extra = "请输入密码。";
		}

		String sql = "SELECT password FROM user WHERE username='" + username + "'";
		ResultSet rs = conn.select(sql);
		try {
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					extra = "登录验证成功。";
					return true;
				} else {
					extra = "密码错误，请重试。";
					return false;
				}
			} else {
				extra = "用户不存在，请重试。";
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			extra = "数据库连接失败，请重试。";
			return false;
		}
	}
}
