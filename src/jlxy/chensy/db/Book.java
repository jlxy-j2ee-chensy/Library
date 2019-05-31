package jlxy.chensy.db;

public class Book {

	private int id;
	private String title, subtitle, author, CIP, ISBN, series, pub_ins, pub_loc, pub_time;
	private int num_edit, num_print;
	private float price;
	private String language, size, binding, category, keywords, description;

	public Book(String title) {
		this.id = 0;
		this.title = title;
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
	}

	public void setId(int id) {
		assert (this.id == 0);
		this.id = id;
	}

	public void setTitle(String title) {
		if (title != null)
			this.title = title;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public void setCIP(String CIP) {
		this.CIP = CIP;
	}

	public void setISBN(String ISBN) {
		this.ISBN = ISBN;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public void setPub_ins(String pub_ins) {
		this.pub_ins = pub_ins;
	}

	public void setPub_loc(String pub_loc) {
		this.pub_loc = pub_loc;
	}

	public void setPub_time(String pub_time) {
		this.pub_time = pub_time;
	}

	public void setBinding(String binding) {
		this.binding = binding;
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

	public void setLanguage(String language) {
		this.language = language;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public String getTitle() {
		return title != null ? title : "";
	}

	public String getPicture() {
		return "/image/book/" + ISBN + ".jpg";
	}

	public String getSubtitle() {
		return subtitle != null ? subtitle : "";
	}

	public String getFullTitle() {
		return title + (subtitle != null ? ("：" + subtitle) : "");
	}

	public String getAuthor() {
		return author != null ? author.replaceAll(
				"(\\s*(?:\\(.\\))?\\s*)([^\\.^,^;^>]*?(?:\\(.*\\))?)(\\s*(?:著|编|图|译|编著|编译|主编|)\\s*(?:\\.|,|;))",
				"$1<a href=\"/Library/book_list.jsp?author=$2\">$2</a>$3") : "";
	}

	public String getCIP() {
		return CIP != null ? CIP : "";
	}

	public String getISBN() {
		return ISBN != null ? ISBN : "";
	}

	public String getSeries() {
		return series != null ? series : "";
	}

	public String getPub_ins() {
		return pub_ins != null ? pub_ins : "";
	}

	public String getPub_loc() {
		return pub_loc != null ? pub_loc : "";
	}

	public String getPub_time() {
		return pub_time != null ? pub_time : "";
	}

	public String getNum_edit() {
		return num_edit == 0 ? "" : (num_edit + "版");
	}

	public int getNum_print() {
		return num_print;
	}

	public float getPrice() {
		return price;
	}

	public String getLanguage() {
		return language != null ? language : "中文";
	}

	public String getSize() {
		return size != null ? size : "";
	}

	public String getBinding() {
		return binding != null ? binding : "";
	}

	public String getCategory() {
		return category != null ? category : "";
	}

	public String getKeywords() {
		return keywords != null ? keywords : "";
	}

	public String getDescription() {
		return description != null ? description : "";
	}

}
