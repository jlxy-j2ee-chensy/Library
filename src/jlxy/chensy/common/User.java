package jlxy.chensy.common;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class User {
	public static final int ROLE_GUEST = 0;
	public static final int ROLE_MEMBER = 1;
	public static final int ROLE_ADMIN = 2;
	public static final String[] ROLE_INFO = { "游客", "普通用户", "管理员" };

	private int id, role;
	private String username, password;
	private Date register_time, login_time;

	public User() {
		this.id = 0;
		this.username = null;
		this.password = null;
		this.role = ROLE_MEMBER;
		this.register_time = null;
		this.login_time = null;
	}

	public String showLogin_time() {
		return Util.dateToString(login_time);
	}

	public String showRegister_time() {
		return Util.dateToString(register_time);
	}

	public int getId() {
		return id;
	}

	public Date getLogin_time() {
		return login_time;
	}

	public String getPassword() {
		return password;
	}

	public Date getRegister_time() {
		return register_time;
	}

	public int getRole() {
		return role;
	}

	public String getUsername() {
		return username;
	}

	/**
	 * 设置ID，仅当当前值为0时可用
	 * @param id
	 */
	public void setId(int id) {
		assert (this.id == 0);
		this.id = id;
	}

	public void setLogin_time(Date login_time) {
		this.login_time = login_time;
	}

	/**
	 * 设置password字段，需要非空
	 * @param password
	 */
	public void setPassword(String password) {
		assert (!Util.isNullOrEmpty(password));
		this.password = password;
	}

	public void setRegister_time(Date register_time) {
		this.register_time = register_time;
	}

	/**
	 * 设置role字段，需要取值在范围中
	 * @param role
	 */
	public void setRole(int role) {
		assert (role == ROLE_ADMIN || role == ROLE_MEMBER);
		this.role = role;
	}

	/**
	 * 设置username字段，需要非空
	 * @param username
	 */
	public void setUsername(String username) {
		assert (!Util.isNullOrEmpty(username));
		this.username = username;
	}
	
	public User parse (ResultSet rs)throws SQLException {
		User user = new User();
		int id = rs.getInt("id");
		String userName = rs.getString("username");
		String password = rs.getString("password");
		int role = rs.getInt("role");
		String registerTime = Util.dateToString(rs.getDate("register_time"));
		String loginTime = Util.dateToString(rs.getDate("login_time"));
		user.setId(id);
		user.setUsername(userName);
		user.setPassword(password);
		user.setRole(role);
		user.setRegister_time(register_time);
		user.setLogin_time(login_time);
		return user;
	}

}
