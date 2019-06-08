package jlxy.chensy.db;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jlxy.chensy.common.Book;

public class Books {
	/**
	 * 获取数据库中图书总数
	 * @return 图书总数
	 */
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

	/**
	 * 获取数据库中图书最大ID
	 * @return 最大ID
	 */
	public int max() {
		int max = 0;
		Conn conn = new Conn();
		String sql = "SELECT MAX(id) m FROM book";
		ResultSet resultSet = conn.select(sql);
		try {
			resultSet.next();
			max = resultSet.getInt("m");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close();
		return max;
	}

	/**
	 * 获取图书信息
	 * @param id 图书的ID
	 * @return 图书对象
	 */
	public Book getBook(int id) {
		Book book = null;
		Conn conn = new Conn("Books.getBook(" + id + ")"); // 开启连接
		String sql = "SELECT * FROM book WHERE id=" + id;
		ResultSet resultSet = conn.select(sql);
		try {
			if (!resultSet.next())
				return null;
			book = parseBook(resultSet);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		conn.close("Book.getBook - 查询完毕"); // 关闭连接
		return book;
	}

	/**
	 * 获取图书数据中出现的所有语言取值
	 * @return 字符串对象的线性表，第一项为"中文"
	 */
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
			book.setCount(resultSet.getInt("count"));
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
			sql += String.format(" AND ISBN REGEXP '%s'", search.getISBN().replaceAll("(\\d)\\-?", "$1-?"));
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

	public Book update(Book book) {
		assert (book.getTitle() != null);
		if (book.getId() != 0) {
			Conn conn = new Conn();
			PreparedStatement sql = conn.preparedStatement(
					"UPDATE book SET title=?,subtitle=?,series=?,author=?,CIP=?,ISBN=?,pub_ins=?,pub_loc=?,pub_time=?,num_edit=?,num_print=?,price=?,language=?,size=?,binding=?,category=?,keywords=?,description=?,count=? WHERE id=?");
			try {
				sql.setString(1, book.getTitle());
				sql.setString(2, book.getSubtitle());
				sql.setString(3, book.getSeries());
				sql.setString(4, book.getAuthor());
				sql.setString(5, book.getCIP());
				sql.setString(6, book.getISBN());
				sql.setString(7, book.getPub_ins());
				sql.setString(8, book.getPub_loc());
				sql.setString(9, book.getPub_time());
				sql.setInt(10, book.getNum_edit());
				sql.setInt(11, book.getNum_print());
				sql.setFloat(12, book.getPrice());
				sql.setString(13, book.getLanguage());
				sql.setString(14, book.getSize());
				sql.setString(15, book.getBinding());
				sql.setString(16, book.getCategory());
				sql.setString(17, book.getKeywords());
				sql.setString(18, book.getDescription());
				sql.setInt(19, book.getCount());
				sql.setInt(20, book.getId());
				sql.executeUpdate();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			conn.close();
			return getBook(book.getId());
		} else {
			Conn conn = new Conn();
			PreparedStatement sql = conn.preparedStatement(
					"INSERT INTO book (title,subtitle,series,author,CIP,ISBN,pub_ins,pub_loc,pub_time,num_edit,num_print,price,language,size,binding,category,keywords,description,count)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			try {
				sql.setString(1, book.getTitle());
				sql.setString(2, book.getSubtitle());
				sql.setString(3, book.getSeries());
				sql.setString(4, book.getAuthor());
				sql.setString(5, book.getCIP());
				sql.setString(6, book.getISBN());
				sql.setString(7, book.getPub_ins());
				sql.setString(8, book.getPub_loc());
				sql.setString(9, book.getPub_time());
				sql.setInt(10, book.getNum_edit());
				sql.setInt(11, book.getNum_print());
				sql.setFloat(12, book.getPrice());
				sql.setString(13, book.getLanguage());
				sql.setString(14, book.getSize());
				sql.setString(15, book.getBinding());
				sql.setString(16, book.getCategory());
				sql.setString(17, book.getKeywords());
				sql.setString(18, book.getDescription());
				sql.setInt(19, book.getCount());
				sql.executeUpdate();
			} catch (SQLException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			conn.close();
			return getBook(max());
		}

	}

	public void delete(int id) {
		if (id > 0) {
			String sql = "DELETE FROM book WHERE id=" + id;
			Conn conn = new Conn();
			conn.update(sql);
			conn.close();
		}
	}
}
