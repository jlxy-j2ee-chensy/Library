package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Books {
	private Conn conn;

	public int count() {
		int count = 0;
		this.conn = new Conn("Book.count()"); // 开启连接
		String sql = "SELECT COUNT(*) c FROM book";
		ResultSet resultSet = conn.select(sql);
		try {
			while (resultSet.next())
				count = resultSet.getInt("c");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close("Book.count - 查询完毕"); // 关闭连接
		return count;
	}

	/* 不移动resultSet的指针 */
	private Book parseBook(ResultSet resultSet) {
		Book book = null;
		try {
			book = new Book(resultSet.getString("title"));
			book.setId(resultSet.getInt("id"));
			book.setSubtitle(resultSet.getString("subtitle"));
			book.setAuthor(resultSet.getString("author"));
			book.setCIP(resultSet.getString("CIP"));
			book.setISBN(resultSet.getString("ISBN"));
			book.setSeries(resultSet.getString("series"));
			book.setPub_ins(resultSet.getString("pub_ins"));
			book.setPub_loc(resultSet.getString("pub_loc"));
			book.setPub_time(resultSet.getString("pub_time"));
			book.setNum_edit(resultSet.getInt("num_edit"));
			book.setNum_print(resultSet.getInt("num_print"));
			book.setPrice(resultSet.getFloat("price"));
			book.setLanguage(resultSet.getString("language"));
			book.setSize(resultSet.getString("size"));
			book.setBinding(resultSet.getString("binding"));
			book.setCategory(resultSet.getString("category"));
			book.setKeywords(resultSet.getString("keywords"));
			book.setDescription(resultSet.getString("description"));
			return book;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	private ArrayList<Book> parseBooks(ResultSet resultSet) {
		ArrayList<Book> list = new ArrayList<Book>();
		try {
			while (resultSet.next()) {
				list.add(parseBook(resultSet));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Book getBookById(int id) {
		Book book = null;
		this.conn = new Conn("Books.getBookById(" + id + ")"); // 开启连接
		String sql = "SELECT * FROM book WHERE id=" + id;
		ResultSet resultSet = conn.select(sql);
		try {
			if (!resultSet.next())
				return getBookById(1); // 若不存在，则返回ID为1的数据
			book = parseBook(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close("Book.getInfoById - 查询完毕"); // 关闭连接
		return book;
	}

	public ArrayList<Book> getAllBooks() {
		this.conn = new Conn("Books.getAllBooks()");
		String sql = "SELECT * FROM book";
		ResultSet resultSet = conn.select(sql);
		ArrayList<Book> list = parseBooks(resultSet);
		conn.close();
		return list;
	}
}
