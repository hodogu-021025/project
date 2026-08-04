package com.test.java.member;

public class Member {

	private String name;
	private int score;
	
	public Member(String name, int score) {
		this.name = name;
		this.score = score;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}
	
	@Override
	public String toString() {
		return "Member [name=" + name + ", score=" + score + "]";
	}
	
}
