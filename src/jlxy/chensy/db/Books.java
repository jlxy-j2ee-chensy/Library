package jlxy.chensy.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Books {
	public int count() {
		int count = 0;
		Conn conn = new Conn("Book.count()"); // 开启连接
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

	public Book getBookById(int id) {
		Book book = null;
		Conn conn = new Conn("Books.getBookById(" + id + ")"); // 开启连接
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

	public ArrayList<String> getLanguages() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("中文");
		Conn conn = new Conn("Books.getLanguages()");
		String sql = "SELECT language, COUNT(*) AS count FROM book GROUP BY language ORDER BY count DESC";
		ResultSet resultSet = conn.select(sql);
		try {
			while (resultSet.next()) {
				if (resultSet.getString("language") != null) {
					list.add(resultSet.getString("language"));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return list;
	}

	/* 不移动resultSet的指针 */
	private Book parseBook(ResultSet resultSet) {
		Book book = null;
		try {
			book = new Book();
			book.setTitle(resultSet.getString("title"));
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

	/**
	 * 根据一个读书对象检索数据库
	 * @param search 提供检索信息的图书对象
	 * @return 符合要求的图书对象线性表
	 */
	public ArrayList<Book> search(Book search) {
		ArrayList<Book> books = new ArrayList<>();
		String sql = "SELECT * FROM book WHERE 1=1";
		ResultSet resultSet;
		Conn conn = new Conn("Books.search()");

		// 精确查找：id, CIP, ISBN, language
		if (search.getId() != 0)
			sql += String.format(" AND id=%d", search.getId());
		if (search.getCIP() != null)
			sql += String.format(" AND CIP='%s'", search.getCIP());
		if (search.getISBN() != null)
			sql += String.format(" AND ISBN='%s'", search.getISBN());
		if (search.getLanguage() != null) {
			if ("中文".equals(search.getLanguage()))
				sql += String.format(" AND language is NULL");
			else
				sql += String.format(" AND language='%s'", search.getLanguage());
		}

		// 模糊查找：title, subtitle, author, series, pub_ins, keywords
		if (search.getTitle() != null)
			sql += String.format(" AND title LIKE '%%%s%%'", search.getTitle());
		if (search.getSubtitle() != null)
			sql += String.format(" AND subtitle LIKE '%%%s%%'", search.getSubtitle());
		if (search.getAuthor() != null)
			sql += String.format(" AND author LIKE '%%%s%%'", search.getAuthor());
		if (search.getSeries() != null)
			sql += String.format(" AND series LIKE '%%%s%%'", search.getSeries());
		if (search.getPub_ins() != null)
			sql += String.format(" AND pub_ins LIKE '%%%s%%'", search.getPub_ins());
		if (search.getKeywords() != null)
			sql += String.format(" AND keywords LIKE '%%%s%%'", search.getKeywords());
		if (search.getDescription() != null)
			sql += String.format(" AND description LIKE '%%%s%%'", search.getDescription());

		if (search.getSearchText() != null) {
			sql += " AND (title LIKE '%" + search.getSearchText() + "%'";
			sql += " OR subtitle LIKE '%" + search.getSearchText() + "%'";
			sql += " OR author LIKE '%" + search.getSearchText() + "%'";
			sql += " OR series LIKE '%" + search.getSearchText() + "%'";
			sql += " OR pub_ins LIKE '%" + search.getSearchText() + "%'";
			sql += " OR keywords LIKE '%" + search.getSearchText() + "%'";
			sql += " OR description LIKE '%" + search.getSearchText() + "%'";
			sql += ")";
		}

		// 未提供查找功能：pub_loc, pub_time, num_edit, num_print, price, size, binding,
		// category,

		System.out.println(sql);
		resultSet = conn.select(sql);
		books = parseBooks(resultSet);
		conn.close();
		return books;
	}
}
