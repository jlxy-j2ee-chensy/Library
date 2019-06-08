package jlxy.chensy.common;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Book {

	private int id;
	private String title, subtitle, author, CIP, ISBN, series, pub_ins, pub_loc, pub_time;
	private int num_edit, num_print;
	private float price;
	private String language, size, binding, category, keywords, description;
	private String searchText;
	private int count;

	public Book() {
		this.id = 0;
		this.title = null;
		this.subtitle = null;
		this.author = null;
		this.CIP = null;
		this.ISBN = null;
		this.series = null;
		this.pub_ins = null;
		this.pub_loc = null;
		this.pub_time = null;
		this.num_edit = 0;
		this.num_print = 0;
		this.price = 0;
		this.language = null;
		this.size = null;
		this.binding = null;
		this.category = null;
		this.keywords = null;
		this.description = null;
		this.searchText = null;
		this.count = 0;
	}

	// Getter方法：直接返回数据

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public String getAuthor() {
		return author;
	}

	public String getCIP() {
		return CIP;
	}

	public String getISBN() {
		return ISBN;
	}

	public String getSeries() {
		return series;
	}

	public String getPub_ins() {
		return pub_ins;
	}

	public String getPub_loc() {
		return pub_loc;
	}

	public String getPub_time() {
		return pub_time;
	}

	public int getNum_edit() {
		return num_edit;
	}

	public int getNum_print() {
		return num_print;
	}

	public float getPrice() {
		return price;
	}

	public String getLanguage() {
		return language;
	}

	public String getSize() {
		return size;
	}

	public String getBinding() {
		return binding;
	}

	public String getCategory() {
		return category;
	}

	public String getKeywords() {
		return keywords;
	}

	public String getDescription() {
		return description;
	}

	public String getSearchText() {
		return searchText;
	}

	// Setter方法：""转为null

	public void setAuthor(String author) {
		this.author = Util.emptyToNull(author);
	}

	public void setBinding(String binding) {
		this.binding = Util.emptyToNull(binding);
	}

	public void setCategory(String category) {
		this.category = Util.emptyToNull(category);
	}

	/**
	 * 设置CIP字段，要求为10位数字
	 * @param CIP
	 */
	public void setCIP(String CIP) {
		if (Util.regexMatch(CIP, "^\\d{10}$"))
			this.CIP = CIP;
		else
			this.CIP = null;
	}

	public void setDescription(String description) {
		this.description = Util.emptyToNull(description);
	}

	/**
	 * 设置ID字段，仅当当前值为0时可以更改
	 * @param id
	 */
	public void setId(int id) {
		if (this.id != 0)
			System.out.println("Book.setId错误");
		this.id = id;
	}

	/**
	 * 设置ISBN字段，要求为13位数字，或带有分隔符
	 * @param ISBN
	 */
	public void setISBN(String ISBN) {
		if (Util.regexMatch(ISBN, "^(\\d\\-?){13}$"))
			this.ISBN = ISBN;
		else
			this.ISBN = null;
	}

	public void setKeywords(String keywords) {
		this.keywords = Util.emptyToNull(keywords);
	}

	/**
	 * 设置language字段，若为"全部"则设为null
	 * @param language
	 */
	public void setLanguage(String language) {
		if ("全部".equals(language))
			this.language = null;
		else
			this.language = Util.emptyToNull(language);
	}

	/**
	 * 设置num_edit字段，需要正整数
	 * @param num_edit
	 */
	public void setNum_edit(int num_edit) {
		if (num_edit < 0)
			System.out.println("Book.setNum_edit错误");
		this.num_edit = num_edit;
	}

	/**
	 * 设置num_edit字段，需要表示正整数的字符串
	 * @param num_edit
	 */
	public void setNum_edit(String num_edit) {
		setNum_edit(Integer.parseInt(num_edit));
	}

	/**
	 * 设置num_print字段，需要正整数
	 * @param num_print
	 */
	public void setNum_print(int num_print) {
		if (num_print < 0)
			System.out.println("Book.setNum_print错误");
		this.num_print = num_print;
	}

	/**
	 * 设置num_print字段，需要表示正整数的字符串
	 * @param num_print
	 */
	public void setNum_print(String num_print) {
		setNum_print(Integer.parseInt(num_print));
	}

	/**
	 * 设置price字段，需要正数
	 * @param price
	 */
	public void setPrice(float price) {
		if (price < 0)
			System.out.println("Book.setPrice错误");
		this.price = price;
	}

	/**
	 * 设置price字段，需要表示正数的字符串
	 * @param price
	 */
	public void setPrice(String price) {
		setPrice(Float.parseFloat(price));
	}

	public void setPub_ins(String pub_ins) {
		this.pub_ins = Util.emptyToNull(pub_ins);
	}

	public void setPub_loc(String pub_loc) {
		this.pub_loc = Util.emptyToNull(pub_loc);
	}

	public void setPub_time(String pub_time) {
		this.pub_time = Util.emptyToNull(pub_time);
	}

	public void setSearchText(String text) {
		this.searchText = Util.emptyToNull(text);
	}

	public void setSeries(String series) {
		this.series = Util.emptyToNull(series);
	}

	public void setSize(String size) {
		this.size = Util.emptyToNull(size);
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = Util.emptyToNull(subtitle);
	}

	public void setTitle(String title) {
		this.title = Util.emptyToNull(title);
	}

	public void setCount(String count) {
		setCount(Integer.parseInt(count));
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public String showAuthor() {
		return Util.nullToEmpty(author);
	}

	public String showBinding() {
		return Util.nullToEmpty(binding);
	}

	public String showCategory() {
		return Util.nullToEmpty(category);
	}

	public String showCIP() {
		return Util.nullToEmpty(CIP);
	}

	public String showDescription() {
		return Util.nullToEmpty(description);
	}

	public String showFullTitle() {
		if (Util.isNullOrEmpty(title))
			return "";
		if (Util.isNullOrEmpty(subtitle))
			return showTitle();
		return showTitle() + "：" + showSubtitle();
	}

	public String showISBN() {
		return Util.nullToEmpty(ISBN);
	}

	public String showKeywords() {
		return Util.nullToEmpty(keywords);
	}

	public String showLanguage() {
		return Util.nullToEmpty(language);
	}

	public String showNum_edit() {
		return num_edit + "";
	}

	public String showNum_print() {
		return num_print + "";
	}

	public String showPrice() {
		return price + "";
	}

	public String showPub_ins() {
		return Util.nullToEmpty(pub_ins);
	}

	public String showPub_loc() {
		return Util.nullToEmpty(pub_loc);
	}

	public String showPub_time() {
		return Util.nullToEmpty(pub_time);
	}

	public String showSeries() {
		return Util.nullToEmpty(series);
	}

	public String showSize() {
		return Util.nullToEmpty(size);
	}

	public String showSubtitle() {
		return Util.nullToEmpty(subtitle);
	}

	public String showTitle() {
		return Util.nullToEmpty(title);
	}

	/**
	 * 获取图片在根文件夹后的路径。需要ISBN字段不为空。
	 * @return
	 */
	public String getPicturePath() {
		if (Util.isNullOrEmpty(ISBN))
			return "";
		return "/image/book/" + ISBN + ".jpg";
	}

	/**
	 * 使用正则表达式分析，获取带有链接的author字段，即带有<a>标签的HTML代码
	 * @return 
	 */
	public String showLinkedAuthor() {
		return Util.nullToEmpty(author).replaceAll(
				"(\\s*(?:\\(.\\))?\\s*)([^\\.^,^;^>]*?(?:\\(.*\\))?)(\\s*(?:著|编|图|译|编著|编译|主编|)\\s*(?:\\.|,|;))",
				"$1<a href=\"/Library/book_list.jsp?author=$2\">$2</a>$3");
	}

	/** 获取带有链接的pub_ins字段，即带有<a>标签的HTML代码
	 * @return
	 */
	public String showLinkedPub_ins() {
		if (Util.isNullOrEmpty(pub_ins))
			return "";
		else
			return String.format("<a href=\"/Library/book_list.jsp?pub_ins=%s\">%s</a>", pub_ins, pub_ins);
	}

	/**
	 * 获取带有链接的language字段，即带有<a>标签的HTML代码
	 * @return 若字段为空，则输出中文
	 */
	public String getLinkedLanguage() {
		if (language != null)
			return "<a href=\"/Library/book_list.jsp?language=" + language + "\">" + language + "</a>";
		else
			return "<a href=\"/Library/book_list.jsp?language=中文\">中文</a>";
	}

	public int getCount() {
		return count;
	}

	public String showCount() {
		return count + "";
	}

	public void setCount(int count) {
		this.count = count;
	}

	public ArrayList<String> getSplitedKeywords() {
		if (Util.isNullOrEmpty(keywords))
			return null;
		ArrayList<String> result = new ArrayList<>();
		for (int i = 5; i >= 0; i--) {
			Pattern pattern = Pattern.compile("－?[^－]+(－[^－]+){" + i + "}$");
			for (String s : keywords.split("；")) {
				Matcher matcher = pattern.matcher(s);
				if (matcher.find()) {
					result.add(matcher.group(0));
				}
			}
		}
		return result;
	}

}
