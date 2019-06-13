package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import jlxy.chensy.common.User;
import jlxy.chensy.common.Util;

public class Users {
	private String extra;

	public String getExtra() {
		return this.extra;
	}

	private User getUser(String username) {
		assert (username != null);
		Conn conn = new Conn("User.getUser(" + username + ")");
		String sql = String.format("SELECT * FROM user WHERE username='%s'", username);
		ResultSet rs = conn.select(sql);
		try {
			if (!rs.next()) {
				conn.close("用户不存在");
				return null;
			} else {
				User user = parse(rs);
				conn.close();
				return user;
			}
		} catch (SQLException e) {
			conn.close("数据库连接失败");
			return null;
		}
	}

	public User update(User user) {
		assert (user.getUsername() != null);
		assert (user.getPassword() != null);
		assert (user.getRole() > 0);
		if (user.getId() != 0) {
			// 修改
			assert (user.getRegister_time() != null);
			assert (user.getLogin_time() != null);
			String sql = "UPDATE user SET username='%s', password='%s', role=%d, register_time='%s', login_time='%s' WHERE id=%d;";
			sql = String.format(sql, user.getUsername(), user.getPassword(), user.getRole(), user.showRegister_time(),
					user.showLogin_time(), user.getId());
			Conn conn = new Conn();
			conn.update(sql);
			conn.close();
			return getUser(user.getUsername());
		} else {
			// 新增
			assert (user.getRegister_time() == null);
			assert (user.getLogin_time() == null);
			user.setRegister_time(new Date());
			user.setLogin_time(new Date());
			String sql = "INSERT INTO user(username, password, role, register_time, login_time) VALUES ('%s', '%s', %d, '%s', '%s');";
			sql = String.format(sql, user.getUsername(), user.getPassword(), user.getRole(), user.showRegister_time(),
					user.showLogin_time());
			Conn conn = new Conn();
			conn.update(sql);
			conn.close();
			return getUser(user.getUsername());
		}
	}

	/**
	 * 验证登录信息 修改extra，存放额外信息
	 * 
	 * @param username 用户输入的用户名
	 * @param password 用户输入的密码
	 * @return 验证成功则返回用户对象，否则返回null
	 */
	public User login(String username, String password) {
		if (Util.isNullOrEmpty(username) || Util.isNullOrEmpty(password))
			System.err.println("传入的/用户名或密码为空！");

		User user = getUser(username);

		if (user == null) {
			extra = "用户不存在！";
			return null;
		}

		if (!password.equals(user.getPassword())) {
			extra = "密码错误！";
			return null;
		}

		user.setLogin_time(new Date());
		this.update(user);

		extra = "登录成功";
		return user;
	}

	/**
	 * 注册用户 修改extra，存放额外信息
	 * 
	 * @param args 用户在表单中填入的内容（键值对）
	 * @return 注册成功返回用户对象，否则返回null
	 */
	public User register(String username, String password) {
		if (Util.isNullOrEmpty(username) || Util.isNullOrEmpty(password))
			System.err.println("传入的/用户名或密码为空！");

		if (getUser(username) != null) {
			extra = "用户已存在！";
			return null;
		}

		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		this.update(user);
		extra = "注册成功";
		return getUser(username);
	}

	public ArrayList<User> getUsers() {
		ArrayList<User> users = new ArrayList<User>();
		String sql = "SELECT * FROM user;";
		Conn conn = new Conn();
		ResultSet rs = conn.select(sql);
		try {
			while (rs.next()) {
				users.add(parse(rs));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		conn.close();
		return users;
	}

	public void delete(String username) {
		String sql = "DELETE FROM user WHERE username='" + username + "';";
		Conn conn = new Conn();
		conn.update(sql);
		conn.close();
	}

	private User parse(ResultSet rs) throws SQLException {
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setUsername(rs.getString("username"));
		user.setPassword(rs.getString("password"));
		user.setRole(rs.getInt("role"));
		user.setRegister_time(rs.getTimestamp("register_time"));
		user.setLogin_time(rs.getTimestamp("login_time"));
		return user;
	}
}
