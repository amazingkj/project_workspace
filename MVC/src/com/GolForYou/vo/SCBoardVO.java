package com.GolForYou.vo;

public class SCBoardVO {
	private int sc_no;
	private String sc_id;
	private String sc_name;
	private String sc_title;
	private String sc_playdate;
	private String sc_cont;
	private String sc_file;
	private int sc_hit;
	private int sc_ref;
	private int sc_step;
	private int sc_level;
	private String sc_date;
	
	//쪽나누기용 변수
	private int startrow; //시작행 번호
	private int endrow; //끝행 번호
	
	//검색기능
	private String find_field;
	private String find_name;
	
	public int getSc_no() {
		return sc_no;
	}
	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
	}
	public String getSc_id() {
		return sc_id;
	}
	public void setSc_id(String sc_id) {
		this.sc_id = sc_id;
	}
	public String getSc_name() {
		return sc_name;
	}
	public void setSc_name(String sc_name) {
		this.sc_name = sc_name;
	}
	public String getSc_title() {
		return sc_title;
	}
	public void setSc_title(String sc_title) {
		this.sc_title = sc_title;
	}
	public String getSc_playdate() {
		return sc_playdate;
	}
	public void setSc_playdate(String sc_playdate) {
		this.sc_playdate = sc_playdate;
	}
	public String getSc_cont() {
		return sc_cont;
	}
	public void setSc_cont(String sc_cont) {
		this.sc_cont = sc_cont;
	}
	public String getSc_file() {
		return sc_file;
	}
	public void setSc_file(String sc_file) {
		this.sc_file = sc_file;
	}
	public int getSc_hit() {
		return sc_hit;
	}
	public void setSc_hit(int sc_hit) {
		this.sc_hit = sc_hit;
	}
	public String getSc_date() {
		return sc_date;
	}
	public void setSc_date(String sc_date) {
		this.sc_date = sc_date.substring(0,10);
	}
	public int getSc_ref() {
		return sc_ref;
	}
	public void setSc_ref(int sc_ref) {
		this.sc_ref = sc_ref;
	}
	public int getSc_step() {
		return sc_step;
	}
	public void setSc_step(int sc_step) {
		this.sc_step = sc_step;
	}
	public int getSc_level() {
		return sc_level;
	}
	public void setSc_level(int sc_level) {
		this.sc_level = sc_level;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	
}

