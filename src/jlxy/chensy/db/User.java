package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

public class User {
	private Conn conn;
	private String extra;

	public String getExtra() {
		return this.extra;
	}

	public User() {
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
			extra = "请输入用户名";
			return false;
		}
		if (password == null || "".equals(password)) {
			extra = "请输入密码";
			return false;
		}

		// 根据用户名查询
		this.conn = new Conn();
		String sql = "SELECT password FROM user WHERE username='" + username + "'";
		ResultSet rs = conn.select(sql);

		try {
			// 查询结果为空
			if (!rs.next()) {
				extra = "用户不存在";
				conn.close();
				return false;
			}

			// 密码不匹配
			if (!password.equals(rs.getString("password"))) {
				extra = "密码错误";
				conn.close();
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			extra = "数据库连接失败，请重试";
			conn.close();
			return false;
		}

		// 获取当前日期时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = df.format(new Date());

		// 更改登录时间
		sql = "UPDATE user SET login_time='" + datetime + "' WHERE username='" + username + "'";
		conn.update(sql);

		conn.close();
		extra = "登录成功";
		return true;
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
			extra = "两次密码输入不一致";
			return false;
		}

		this.conn = new Conn();
		String sql = "SELECT * FROM user WHERE username='" + username + "'";
		ResultSet rs = conn.select(sql);
		try {
			if (rs.next()) {
				extra = "用户已存在";
				conn.close();
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			extra = "数据库连接失败，请重试";
			conn.close();
			return false;
		}

		// 获取当前日期时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = df.format(new Date());

		sql = "INSERT INTO user(username, password, register_time, login_time) ";
		sql += "VALUES ('" + username + "', '" + password + "', '" + datetime + "', '" + datetime + "')";
		conn.update(sql);
		conn.close();
		extra = "注册成功";
		return true;
	}
}
