package jlxy.chensy.db;

import java.sql.Connection;
import java.sql.DriverManager;
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
	 * 初始化并开启数据库连接
	 * @param DBDRIVER 驱动器
	 * @param DBURL URL
	 * @param DBUSER 用户名
	 * @param DBPASS 密码
	 * @param info 控制台输出的额外信息
	 */
	public Conn(String DBDRIVER, String DBURL, String DBUSER, String DBPASS, String info) {
		this.DBDRIVER = DBDRIVER;
		this.DBURL = DBURL;
		this.DBUSER = DBUSER;
		this.DBPASS = DBPASS;
		start(info);
	}

	/**
	 * 初始化并开启默认的数据库连接
	 * @param info 控制台输出的额外信息
	 */
	public Conn(String info) {
		// 数据库名：library
		// 用户名：root
		// 密码：123456
		this("org.gjt.mm.mysql.Driver", "jdbc:mysql://localhost:3306/library?useSSL=false", "root", "123456", info);
	}

	/**
	 * 初始化并开启默认的数据库连接（不输出额外信息）
	 */
	public Conn() {
		this(null);
	}

	private void start(String info) {
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

	/**
	 * 关闭数据库连接（不输出额外信息）
	 */
	public void close() {
		close(null);
	}

	/**
	 * 执行更新操作：insert、update、delete
	 * @param sql 要执行的SQL语句 (insert/update/delete)
	 */
	public void update(String sql) {
		try {
			stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
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
}
