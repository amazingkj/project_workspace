package com.GolForYou.vo;

public class LikeVO {
	
	int num; //좋아요 식별자
	int aNum; //좋아요 대상 게시물 식별자 
	String checkMember; //좋아요 한 유저의 식별자
	String regDate; //좋아요 체크한 날짜
	
	
	public LikeVO(int num, int aNum, String checkMember, String regDate) {
		super();
		this.num = num;
		this.aNum = aNum;
		this.checkMember = checkMember;
		this.regDate = regDate;
	}


	public LikeVO() {
		
	}
	
	
}
