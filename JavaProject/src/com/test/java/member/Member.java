package com.test.java.member;

public class Member {

	private String name1;
	private String name2;
	private int score1;
	private int score2;
	private int setscore1;
	private int setscore2;
	
	public Member(String name1, String name2, int score1, int score2, int setscore1, int setscore2) {
		super();
		this.name1 = name1;
		this.name2 = name2;
		this.score1 = score1;
		this.score2 = score2;
		this.setscore1 = setscore1;
		this.setscore2 = setscore2;
	}

	public String getName1() {
		return name1;
	}

	public void setName1(String name1) {
		this.name1 = name1;
	}

	public String getName2() {
		return name2;
	}

	public void setName2(String name2) {
		this.name2 = name2;
	}

	public int getScore1() {
		return score1;
	}

	public void setScore1(int score1) {
		this.score1 = score1;
	}

	public int getScore2() {
		return score2;
	}

	public void setScore2(int score2) {
		this.score2 = score2;
	}

	public int getSetscore1() {
		return setscore1;
	}
	
	public void setSetscore1(int setscore1) {
		this.setscore1 = setscore1;
	}
	
	public int getSetscore2() {
		return setscore2;
	}
	
	public void setSetscore2(int setscore2) {
		this.setscore2 = setscore2;
	}

	@Override
	public String toString() {
		return "Member [name1=" + name1 + ", name2=" + name2 + ", score1=" + score1 + ", score2=" + score2
				+ ", setscore1=" + setscore1 + ", setscore2=" + setscore2 + "]";
	}

}
