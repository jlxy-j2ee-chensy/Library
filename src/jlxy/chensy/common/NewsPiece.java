package jlxy.chensy.common;

import java.util.Date;

public class NewsPiece {
	private int id;
	private String title, content;
	private Date time;

	public NewsPiece() {
		this.id = 0;
		this.title = null;
		this.content = null;
		this.time = null;
	}

	/**
	 * @return id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @return title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @return content
	 */
	public String getContent() {
		return content;
	}

	/**
	 * @return time
	 */
	public Date getTime() {
		return time;
	}

	public String showDate() {
		return Util.dateToString(time, "yyyy/MM/dd");
	}

	public String showTitle() {
		return Util.isNullOrEmpty(title) ? "" : title;
	}

	public String showContent() {
		return Util.isNullOrEmpty(content) ? "" : content;
	}

	/**
	 * 仅当前字段值为0时可用
	 * @param id 要设置的 id
	 */
	public void setId(int id) {
		if (this.id == 0)
			this.id = id;
	}

	/**
	 * @param title 要设置的 title
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @param content 要设置的 content
	 */
	public void setContent(String content) {
		this.content = content;
	}

	/**
	 * @param time 要设置的 time
	 */
	public void setTime(Date time) {
		this.time = time;
	}

	public void updateTime() {
		this.time = new Date();
	}

}
