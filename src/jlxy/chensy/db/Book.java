package jlxy.chensy.db;

public class Book {

	private int id;
	private String title, subtitle, author, CIP, ISBN, series, pub_ins, pub_loc, pub_time;
	private int num_edit, num_print;
	private float price;
	private String language, size, binding, category, keywords, description;
	private String searchText;

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
	}

	public String getAuthor() {
		return author;
	}

	public String getBinding() {
		return binding;
	}

	public String getCategory() {
		return category;
	}

	public String getCIP() {
		return CIP;
	}

	public String getDescription() {
		return description;
	}

	public String getDisplayAuthor() {
		return author != null ? author.replaceAll(
				"(\\s*(?:\\(.\\))?\\s*)([^\\.^,^;^>]*?(?:\\(.*\\))?)(\\s*(?:著|编|图|译|编著|编译|主编|)\\s*(?:\\.|,|;))",
				"$1<a href=\"/Library/book_list.jsp?author=$2\">$2</a>$3") : "";
	}

	public String getDisplayBinding() {
		return binding != null ? binding : "";
	}

	public String getDisplayCategory() {
		return category != null ? category : "";
	}

	public String getDisplayCIP() {
		return CIP != null ? CIP : "";
	}

	public String getDisplayDescription() {
		return description != null ? description : "";
	}

	public String getDisplayFullTitle() {
		return title + (subtitle != null ? ("：" + subtitle) : "");
	}

	public String getDisplayISBN() {
		return ISBN != null ? ISBN : "";
	}

	public String getDisplayKeywords() {
		return keywords != null ? keywords : "";
	}

	public String getDisplayLanguage() {
		if (language != null)
			return "<a href=\"/Library/book_list.jsp?language=" + language + "\">" + language + "</a>";
		else
			return "<a href=\"/Library/book_list.jsp?language=中文\">中文</a>";
	}

	public String getDisplayNum_edit() {
		return num_edit == 0 ? "" : (num_edit + "版");
	}

	public int getDisplayNum_print() {
		return num_print;
	}

	public String getDisplayPicture() {
		return "/image/book/" + ISBN + ".jpg";
	}

	public float getDisplayPrice() {
		return price;
	}

	public String getDisplayPub_ins() {
		return pub_ins != null ? String.format("<a href=\"/Library/book_list.jsp?pub_ins=%s\">%s</a>", pub_ins, pub_ins)
				: "";
	}

	public String getDisplayPub_loc() {
		return pub_loc != null ? pub_loc : "";
	}

	public String getDisplayPub_time() {
		return pub_time != null ? pub_time : "";
	}

	public String getDisplaySeries() {
		return series != null ? series : "";
	}

	public String getDisplaySize() {
		return size != null ? size : "";
	}

	public String getDisplaySubtitle() {
		return subtitle != null ? subtitle : "";
	}

	public String getDisplayTitle() {
		return title != null ? title : "";
	}

	public int getId() {
		return id;
	}

	public String getISBN() {
		return ISBN;
	}

	public String getKeywords() {
		return keywords;
	}

	public String getLanguage() {
		return language;
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

	public String getPub_ins() {
		return pub_ins;
	}

	public String getPub_loc() {
		return pub_loc;
	}

	public String getPub_time() {
		return pub_time;
	}

	public String getSearchText() {
		return this.searchText;
	}

	public String getSeries() {
		return series;
	}

	public String getSize() {
		return size;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public String getTitle() {
		return title;
	}

	public void setAuthor(String author) {
		this.author = "".equals(author) ? null : author;
	}

	public void setBinding(String binding) {
		this.binding = "".equals(binding) ? null : binding;
	}

	public void setCategory(String category) {
		this.category = "".equals(category) ? null : category;
	}

	public void setCIP(String CIP) {
		this.CIP = "".equals(CIP) ? null : CIP;
	}

	public void setDescription(String description) {
		this.description = "".equals(description) ? null : description;
	}

	public void setId(int id) {
		assert (this.id == 0);
		this.id = id;
	}

	public void setISBN(String ISBN) {
		this.ISBN = "".equals(ISBN) ? null : ISBN.replaceAll("(\\d{3})(\\d)(\\d{3})(\\d{5})(\\d)", "$1-$2-$3-$4-$5");
	}

	public void setKeywords(String keywords) {
		this.keywords = "".equals(keywords) ? null : keywords;
	}

	public void setLanguage(String language) {
		this.language = ("".equals(language) || "全部".equals(language)) ? null : language;
	}

	public void setNum_edit(int num_edit) {
		this.num_edit = num_edit;
	}

	public void setNum_print(int num_print) {
		this.num_print = num_print;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public void setPub_ins(String pub_ins) {
		this.pub_ins = "".equals(pub_ins) ? null : pub_ins;
	}

	public void setPub_loc(String pub_loc) {
		this.pub_loc = "".equals(pub_loc) ? null : pub_loc;
	}

	public void setPub_time(String pub_time) {
		this.pub_time = "".equals(pub_time) ? null : pub_time;
	}

	public void setSearchText(String text) {
		this.searchText = "".equals(text) ? null : text;
	}

	public void setSeries(String series) {
		this.series = "".equals(series) ? null : series;
	}

	public void setSize(String size) {
		this.size = "".equals(size) ? null : size;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = "".equals(subtitle) ? null : subtitle;
	}

	public void setTitle(String title) {
		this.title = "".equals(title) ? null : title;
	}

}
