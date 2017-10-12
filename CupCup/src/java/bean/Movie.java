package bean;

public class Movie {
	private int m_id; 
	private String director; 
	private float rate; 
	private String title; 
	private String casts; 
	private String cover; 
	private String adaptor; 
	private String type; 
	private String date; 
	private String timelen; 
	private String summary;
	private String englishName;
	private String boxOffice;
	
	public int getM_id() {
		return m_id;
	}
	public void setM_id(int m_id) {
		this.m_id = m_id;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCasts() {
		return casts;
	}
	public void setCasts(String casts) {
		this.casts = casts;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getAdaptor() {
		return adaptor;
	}
	public void setAdaptor(String adaptor) {
		this.adaptor = adaptor;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTimelen() {
		return timelen;
	}
	public void setTimelen(String timelen) {
		this.timelen = timelen;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public Movie(int m_id, String director, float rate, String title,
			String casts, String cover, String adaptor, String type,
			String date, String timelen, String summary) {
		super();
		this.m_id = m_id;
		this.director = director;
		this.rate = rate;
		this.title = title;
		this.casts = casts;
		this.cover = cover;
		this.adaptor = adaptor;
		this.type = type;
		this.date = date;
		this.timelen = timelen;
		this.summary = summary;
	}
	public Movie(String director, float rate, String title, String casts,
			String cover, String adaptor, String type, String date,
			String timelen, String summary) {
		super();
		this.director = director;
		this.rate = rate;
		this.title = title;
		this.casts = casts;
		this.cover = cover;
		this.adaptor = adaptor;
		this.type = type;
		this.date = date;
		this.timelen = timelen;
		this.summary = summary;
	}
	
	
	public Movie(int m_id, String director, float rate, String title,
			String casts, String cover, String adaptor, String type,
			String date, String timelen, String summary, String englishName,
			String boxOffice) {
		super();
		this.m_id = m_id;
		this.director = director;
		this.rate = rate;
		this.title = title;
		this.casts = casts;
		this.cover = cover;
		this.adaptor = adaptor;
		this.type = type;
		this.date = date;
		this.timelen = timelen;
		this.summary = summary;
		this.englishName = englishName;
		this.boxOffice = boxOffice;
	}
	public Movie() {
		super();
	}
	@Override
	public String toString() {
		return "Movie [m_id=" + m_id + ", director=" + director + ", rate="
				+ rate + ", title=" + title + ", casts=" + casts + ", cover="
				+ cover + ", adaptor=" + adaptor + ", type=" + type + ", date="
				+ date + ", timelen=" + timelen + ", summary=" + summary
				+ ", englishName=" + englishName + ", boxOffice=" + boxOffice
				+ "]";
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getBoxOffice() {
		return boxOffice;
	}
	public void setBoxOffice(String boxOffice) {
		this.boxOffice = boxOffice;
	}
	
	

}
