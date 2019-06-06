package jlxy.chensy.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Conn {
	private String DBDRIVER;
	private String DBURL;
	private String DBUSER;
	private String DBPASS;
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rs = null;

	/**
	 * 初始化并开启默认的数据库连接（不输出额外信息）。
	 * 数据库名	library
	 * 用户名	root
	 * 密码		123456
	 */
	public Conn() {
		this(null);
	}

	/**
	 * 初始化并开启默认的数据库连接。
	 * 数据库名	library
	 * 用户名	root
	 * 密码		123456
	 * @param info 控制台输出的额外信息
	 */
	public Conn(String info) {
		this("org.gjt.mm.mysql.Driver", "jdbc:mysql://localhost:3306/library?useSSL=false", "root", "123456", info);
	}

	/**
	 * 初始化并开启数据库连接
	 * @param driver 驱动器
	 * @param url URL
	 * @param username 用户名
	 * @param password 密码
	 * @param info 控制台输出的额外信息
	 */
	public Conn(String driver, String url, String username, String password, String info) {
		this.DBDRIVER = driver;
		this.DBURL = url;
		this.DBUSER = username;
		this.DBPASS = password;

		try {
			Class.forName(this.DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			this.conn = DriverManager.getConnection(this.DBURL, this.DBUSER, this.DBPASS);
			this.stmt = this.conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		if (info == null)
			System.out.println("> 开启数据库连接");
		else
			System.out.println("> 开启数据库连接：" + info);
	}

	/**
	 * 关闭数据库连接（不输出额外信息）
	 */
	public void close() {
		close(null);
	}

	/**
	 * 关闭数据库连接
	 * @param info 控制台输出的额外信息
	 */
	public void close(String info) {
		try {
			if (this.rs != null)
				this.rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (this.stmt != null)
				this.stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (this.conn != null)
				this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (info == null)
			System.out.println("- 关闭数据库连接");
		else
			System.out.println("- 关闭数据库连接：" + info);
	}

	public PreparedStatement preparedStatement(String sql) {
		try {
			return this.conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 执行查询操作：select
	 * @param sql 要执行的SQL语句 (select)
	 * @return 查询结果
	 */
	public ResultSet select(String sql) {
		try {
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	/**
	 * 执行更新操作：insert、update、delete
	 * @param sql 要执行的SQL语句 (insert/update/delete)
	 */
	public int update(String sql) {
		int result = 0;
		try {
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
