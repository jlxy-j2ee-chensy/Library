package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class Book {
	private Conn conn;

	public int count() {
		int count = 0;
		this.conn = new Conn(); // 开启连接
		String sql = "SELECT COUNT(*) c FROM book";
		ResultSet resultSet = conn.select(sql);
		try {
			while (resultSet.next())
				count = resultSet.getInt("c");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close(); // 关闭连接
		return count;
	}

	public HashMap<String, String> getInfoById(int id) {
		HashMap<String, String> info = new HashMap<String, String>();
		this.conn = new Conn(); // 开启连接
		String sql = "SELECT * FROM book WHERE id=" + id;
		ResultSet resultSet = conn.select(sql);
		try {
			if (!resultSet.next())
				return getInfoById(1);
			info.put("title", resultSet.getString("title"));
			info.put("subtitle", resultSet.getString("subtitle"));
			info.put("ISBN", resultSet.getString("ISBN"));
			info.put("author", resultSet.getString("author"));
			info.put("description", resultSet.getString("description"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close(); // 关闭连接
		return info;
	}
}
