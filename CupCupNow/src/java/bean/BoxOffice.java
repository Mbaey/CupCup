package bean;

public class BoxOffice {
	private int id;
	private int Irank;
	private int mId;
	private String MovieName;
	private String BoxOffice;
	private String sumBoxOffice;
	private int movieDay;
	private String boxPer;
	private String MovieImg;
	public BoxOffice(int id, int irank, int mId, String movieName,
			String boxOffice, String sumBoxOffice, int movieDay, String boxPer,
			String movieImg) {
		super();
		this.id = id;
		Irank = irank;
		this.mId = mId;
		MovieName = movieName;
		BoxOffice = boxOffice;
		this.sumBoxOffice = sumBoxOffice;
		this.movieDay = movieDay;
		this.boxPer = boxPer;
		MovieImg = movieImg;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIrank() {
		return Irank;
	}
	public void setIrank(int irank) {
		Irank = irank;
	}
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getMovieName() {
		return MovieName;
	}
	public void setMovieName(String movieName) {
		MovieName = movieName;
	}
	public String getBoxOffice() {
		return BoxOffice;
	}
	public void setBoxOffice(String boxOffice) {
		BoxOffice = boxOffice;
	}
	public String getSumBoxOffice() {
		return sumBoxOffice;
	}
	public void setSumBoxOffice(String sumBoxOffice) {
		this.sumBoxOffice = sumBoxOffice;
	}
	public int getMovieDay() {
		return movieDay;
	}
	public void setMovieDay(int movieDay) {
		this.movieDay = movieDay;
	}
	public String getBoxPer() {
		return boxPer;
	}
	public void setBoxPer(String boxPer) {
		this.boxPer = boxPer;
	}
	public String getMovieImg() {
		return MovieImg;
	}
	public void setMovieImg(String movieImg) {
		MovieImg = movieImg;
	}
	public BoxOffice() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "BoxOffice [id=" + id + ", Irank=" + Irank + ", mId=" + mId
				+ ", MovieName=" + MovieName + ", BoxOffice=" + BoxOffice
				+ ", sumBoxOffice=" + sumBoxOffice + ", movieDay=" + movieDay
				+ ", boxPer=" + boxPer + ", MovieImg=" + MovieImg + "]";
	}
	
	
	

}
