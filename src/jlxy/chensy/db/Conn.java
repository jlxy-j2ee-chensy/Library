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
	private Connection conn;
	private Statement stmt;
	private ResultSet rs = null;

	public Conn() {
		this.DBDRIVER = "org.gjt.mm.mysql.Driver";
		this.DBURL = "jdbc:mysql://localhost:3306/resume_control?useSSL=false";
		this.DBUSER = "root";
		this.DBPASS = "123456";
		startDataBase();
	}

	public Conn(String DBDRIVER, String DBURL, String DBUSER, String DBPASS) {
		this.DBDRIVER = DBDRIVER;
		this.DBURL = DBURL;
		this.DBUSER = DBUSER;
		this.DBPASS = DBPASS;
		startDataBase();
	}

	public void startDataBase() {
		try {
			Class.forName(this.DBDRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			this.conn = DriverManager.getConnection(this.DBURL, this.DBUSER, this.DBPASS);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			stmt = conn.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeDataBase() {
		try {
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void modifyCommand(String strSql) {
		try {
			stmt.executeUpdate(strSql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ResultSet selectCommand(String strSql) {
		try {
			rs = stmt.executeQuery(strSql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}
}
