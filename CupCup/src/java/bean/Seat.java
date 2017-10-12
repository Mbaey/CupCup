package bean;

public class Seat {
	private int seat_id;
	private int scene_id;
	private int seat_num;
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getScene_id() {
		return scene_id;
	}
	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}
	public int getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(int seat_num) {
		this.seat_num = seat_num;
	}
	public Seat(int scene_id, int seat_num) {
		super();
		this.scene_id = scene_id;
		this.seat_num = seat_num;
	}
	public Seat() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Seat [seat_id=" + seat_id + ", scene_id=" + scene_id
				+ ", seat_num=" + seat_num + "]";
	}
	
	

}
