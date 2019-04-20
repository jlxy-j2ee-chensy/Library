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

	public Conn() {
		// 数据库名：library
		// 用户名：root
		// 密码：123456
		this.DBDRIVER = "org.gjt.mm.mysql.Driver";
		this.DBURL = "jdbc:mysql://localhost:3306/library?useSSL=false";
		this.DBUSER = "root";
		this.DBPASS = "123456";
		start();
	}

	public Conn(String DBDRIVER, String DBURL, String DBUSER, String DBPASS) {
		this.DBDRIVER = DBDRIVER;
		this.DBURL = DBURL;
		this.DBUSER = DBUSER;
		this.DBPASS = DBPASS;
		start();
	}

	/**
	 * 加载驱动程序，开启数据库连接
	 */
	public void start() {
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
	}

	/**
	 * 关闭数据库连接
	 */
	public void close() {
		try {
			if (this.rs != null)
				this.rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (this.stmt != null)
				this.rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (this.conn != null)
				this.rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
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
