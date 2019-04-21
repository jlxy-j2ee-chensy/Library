package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class User {
	private Conn conn;
	private String extra;

	public String getExtra() {
		return extra;
	}

	public User() {
		this.conn = new Conn();
		extra = "初始化";
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
			extra = "用户名不能为空";
			return false;
		}
		if (password == null || "".equals(password)) {
			extra = "密码不能为空";
		}

		String sql = "SELECT password FROM user WHERE username='" + username + "'";
		ResultSet rs = conn.select(sql);
		try {
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					extra = "登录验证成功";
					return true;
				} else {
					extra = "密码错误";
					return false;
				}
			} else {
				extra = "用户不存在";
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			extra = "数据库连接失败，请重试";
			return false;
		}
	}

	/**
	 * 注册用户
	 * 修改extra，存放额外信息
	 * @param args 用户在表单中填入的内容（键值对）
	 * @return 是否注册成功
	 */
	public boolean register(HashMap<String, String> args) {
		String username = args.get("username");
		String password = args.get("password");
		String password2 = args.get("password2");

		if (username == null || "".equals(username)) {
			extra = "用户名不能为空";
			return false;
		}
		if (password == null || "".equals(password)) {
			extra = "密码不能为空";
			return false;
		}
		if (!password.equals(password2)) {
			extra = "密码输入不一致";
			return false;
		}

		String sql = "SELECT * FROM user WHERE username='" + username + "'";
		ResultSet rs = conn.select(sql);
		try {
			if (rs.next()) {
				extra = "用户已存在";
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			extra = "数据库连接失败，请重试";
			return false;
		}

		sql = "INSERT INTO user(username, password) VALUES ('" + username + "', '" + password + "')";
		conn.update(sql);
		extra = "注册成功";
		return true;
	}
}
