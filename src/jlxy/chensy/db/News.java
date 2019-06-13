package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jlxy.chensy.common.NewsPiece;

public class News {
	/**
	 * 获取数据库中新闻最大ID
	 * @return 最大ID
	 */
	public int max() {
		int max = 0;
		Conn conn = new Conn("News.max");
		String sql = "SELECT MAX(id) m FROM news";
		ResultSet resultSet = conn.select(sql);
		try {
			resultSet.next();
			max = resultSet.getInt("m");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close("News.max");
		return max;
	}

	public NewsPiece get(int id) {
		if (id <= 0)
			System.err.println("News.get错误");
		Conn conn = new Conn("News.get");
		String sql = "SELECT * FROM news WHERE id=" + id + ";";
		ResultSet rs = conn.select(sql);
		try {
			if (rs.next()) {
				NewsPiece newsPiece = parse(rs);
				conn.close();
				return newsPiece;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close("News.get");
		return null;
	}

	public ArrayList<NewsPiece> getLatest(int count) {
		ArrayList<NewsPiece> list = new ArrayList<NewsPiece>();
		if (count < 0)
			return list;
		if (count == 0)
			count = max();
		Conn conn = new Conn();
		String sql = "SELECT * FROM news ORDER BY time DESC";
		ResultSet rs = conn.select(sql);
		for (int i = 1; i <= count; i++) {
			try {
				if (!rs.next()) {
					conn.close();
					return list;
				}
				list.add(parse(rs));
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		conn.close();
		return list;
	}

	public NewsPiece update(NewsPiece newsPiece) {
		if (newsPiece.getId() < 0) {
			System.err.println("News.update()错误");
			return null;
		} else if (newsPiece.getId() == 0) {
			Conn conn = new Conn();
			String sql = "INSERT INTO news (title, content, time) VALUES ('%s','%s','%s');";
			sql = String.format(sql, newsPiece.getTitle(), newsPiece.getContent(), newsPiece.showDate());
			conn.update(sql);
			conn.close();
			return get(max());
		} else {
			Conn conn = new Conn();
			String sql = "UPDATE news SET title='%s', content='%s', time='%s' WHERE id=%d;";
			sql = String.format(sql, newsPiece.getTitle(), newsPiece.getContent(), newsPiece.showDate(),
					newsPiece.getId());
			conn.update(sql);
			conn.close();
			return get(newsPiece.getId());
		}
	}

	public void delete(int id) {
		if (id > 0) {
			String sql = "DELETE FROM news WHERE id=" + id;
			Conn conn = new Conn();
			conn.update(sql);
			conn.close();
		}
	}

	/**
	 * @param rs
	 * @return
	 * @throws SQLException 
	 */
	private NewsPiece parse(ResultSet rs) throws SQLException {
		NewsPiece newsPiece = new NewsPiece();
		newsPiece.setId(rs.getInt("id"));
		newsPiece.setTitle(rs.getString("title"));
		newsPiece.setContent(rs.getString("content"));
		newsPiece.setTime(rs.getDate("time"));
		return newsPiece;
	}
}
