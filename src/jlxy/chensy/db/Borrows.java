package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import jlxy.chensy.common.Borrow;

public class Borrows {

	public Borrow get(int userid, int bookid) {
		if (userid <= 0 || bookid <= 0) {
			System.err.println("Borrows.get错误");
		}
		Conn conn = new Conn();
		String sql = String.format("SELECT * FROM borrow WHERE userid=%d AND bookid=%d;", userid, bookid);
		ResultSet resultSet = conn.select(sql);
		Borrow borrow = null;
		try {
			if (resultSet.next()) {
				borrow = parse(resultSet);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return borrow;
	}

	public Borrow parse(ResultSet resultSet) {
		Borrow borrow = null;
		try {
			int userid = resultSet.getInt("userid");
			int bookid = resultSet.getInt("bookid");
			int status = resultSet.getInt("status");
			Date time = resultSet.getDate("time");
			borrow = new Borrow(userid, bookid, status, time);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return borrow;
	}

	public void set(Borrow borrow) {
		if (borrow.getUserId() <= 0 || borrow.getBookId() <= 0) {
			System.err.println("Borrows.set错误");
			return;
		}
		System.out.println(borrow.getUserId() + "-" + borrow.getBookId());
		if (get(borrow.getUserId(), borrow.getBookId()) != null) {
			if (borrow.getStatus() == Borrow.STATUS_RETURNED) {
				Conn conn = new Conn();
				String sql = "DELETE FROM borrow WHERE userid=%d AND bookid=%d;";
				sql = String.format(sql, borrow.getUserId(), borrow.getBookId());
				conn.update(sql);
			} else {
				Conn conn = new Conn();
				String sql = "UPDATE borrow SET status=%d, time=%s WHERE userid=%d AND bookid=%d;";
				sql = String.format(sql, borrow.getStatus(), borrow.showTime(), borrow.getUserId(), borrow.getBookId());
				conn.update(sql);
			}
		} else {
			Conn conn = new Conn();
			String sql = "INSERT INTO borrow(userid, bookid, status, time) VALUES (%d, %d, %d, '%s');";
			sql = String.format(sql, borrow.getUserId(), borrow.getBookId(), borrow.getStatus(), borrow.showTime());
			conn.update(sql);
		}
	}

	public ArrayList<Borrow> getByUser(int userid) {
		if (userid <= 0) {
			System.err.println("Borrows.getByUser错误");
			return null;
		}
		ArrayList<Borrow> list = new ArrayList<>();
		Conn conn = new Conn();
		String sql = "SELECT * FROM borrow WHERE userid=" + userid + ";";
		ResultSet resultSet = conn.select(sql);
		try {
			while (resultSet.next())
				list.add(parse(resultSet));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Borrow> getByBook(int bookid) {
		if (bookid <= 0) {
			System.err.println("Borrows.getByBook错误");
			return null;
		}
		ArrayList<Borrow> list = new ArrayList<>();
		Conn conn = new Conn();
		String sql = "SELECT * FROM borrow WHERE bookid=" + bookid + ";";
		ResultSet resultSet = conn.select(sql);
		try {
			while (resultSet.next())
				list.add(parse(resultSet));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
