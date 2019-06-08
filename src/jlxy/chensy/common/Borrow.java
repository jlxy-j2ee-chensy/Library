package jlxy.chensy.common;

import java.util.Date;

public class Borrow {

	public static final int STATUS_BOOKED = 1;
	public static final int STATUS_BORROWED = 2;
	public static final int STATUS_RETURNED = 3;
	public static final String[] STATUS_INFO = { "undefined", "预约", "已借", "已还" };

	private int userid;
	private int bookid;
	private int status;
	private Date time;

	public Borrow() {
		this.userid = 0;
		this.bookid = 0;
		this.status = 0;
	}

	public Borrow(int userid, int bookid) {
		this.userid = userid;
		this.bookid = bookid;
		this.status = STATUS_BOOKED;
	}

	public Borrow(int userid, int bookid, int status, Date time) {
		this.userid = userid;
		this.bookid = bookid;
		this.status = status;
		this.time = time;
	}

	public void setStatus(int status) {
		this.status = status;
		this.time = new Date();
	}

	public int getStatus() {
		return status;
	}

	public String showStatus() {
		return STATUS_INFO[status];
	}

	public int getUserId() {
		return userid;
	}

	public int getBookId() {
		return bookid;
	}

	public Date getTime() {
		return time;
	}

	public String showTime() {
		return Util.dateToString(time);
	}
}
