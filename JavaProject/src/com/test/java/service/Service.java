package com.test.java.service;

import java.util.List;
import java.util.Scanner;

import com.test.java.data.Data;
import com.test.java.member.Member;
import com.test.java.ui.UI;

public class Service {
		public static void playerAdd() {
			System.out.print("1번 선수의 이름: ");
			Scanner scan = new Scanner(System.in);
			
			String name1 = scan.next();
			System.out.println();
			System.out.printf("✅ 1번 선수 %s\r\n", name1);
			System.out.println();
			
			System.out.print("2번 선수의 이름: ");
			String name2 = scan.next();
			System.out.println();
			System.out.printf("✅ 2번 선수 %s\r\n", name2);
			System.out.println();
			
			Data data = new Data();
			
			int score1 = 0;
			int score2 = 0;
			
			Member member = new Member(name1, name2, score1, score2);
			
			int result = data.saveFile(member);
			if (result == 1) {
				UI.sendMessage("등록에 성공하였습니다!");
			} else {
				UI.sendWarning("등록에 실패하였습니다.");
			}
		}
		
		public static void playerReset() {
		    
		    Data data = new Data();
		    List<Member> list = data.list();
		    Member member = list.get(0);
		    
		    member.setName1("등록된 선수가 없습니다!");
		    member.setName2("등록된 선수가 없습니다!");
		    member.setScore1(0);
		    member.setScore2(0);
		    
	    	int result = data.saveFile(member);
	    	
		    UI.sendMessage("정보가 리셋되었습니다!\r\n");
		}
		
		public static void playerList() {
		    
		    Data data = new Data();
		    List<Member> list = data.list();
		    
		    if (list.isEmpty()) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		        for (Member member : list) {
					UI.listUI();
		            System.out.printf("1번 선수: %s | 점수: %d\r\n", member.getName1(), member.getScore1());
		            System.out.printf("2번 선수: %s | 점수: %d\r\n", member.getName2(), member.getScore2());
		        }
		    }
		}
		
		public static void scoreList() {
			
		    Data data = new Data();
		    List<Member> list = data.list();
		    
		    if (list.isEmpty()) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		        for (Member member : list) {
					UI.scoreUI();
		    		System.out.printf("%s 선수 | 점수: %d\r\n", member.getName1(), member.getScore1());
		    		System.out.printf("%s 선수 | 점수: %d\r\n", member.getName2(), member.getScore2());
		    		System.out.println();
		        }
		    }
		}
		
		public static void gameStart() {
			
			Data data = new Data();
		    List<Member> list = data.list();
			
		    Member member = list.get(0);
		    
		    UI.startUI();
		    
		    if (member.getName1().equals("등록된 선수가 없습니다!")||member.equals("등록된 선수가 없습니다!")) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		    	Scanner scan = new Scanner(System.in);
		    	boolean loop = true;
		    	
			    while (loop) {
			    	System.out.print("🔥 득점한 선수: ");
			    	String player = scan.next();
			    	if (member.getScore1() < 11 && member.getScore2() < 11) {
			    		if (player.equals(member.getName1())) {
			    			member.setScore1(member.getScore1() + 1);
			    			UI.sendMessage(member.getName1() + " 선수 득점!!\r\n");
			    			int result = data.saveFile(member);
			    			scoreList();
			    		} else if (player.equals(member.getName2())) {
			    			member.setScore2(member.getScore2() + 1);
			    			UI.sendMessage(member.getName2() + " 선수 득점!!\r\n");
			    			int result = data.saveFile(member);
			    			scoreList();
			    		}  else {
			    			UI.sendWarning("선수의 이름을 입력하세요\r\n");
			    		}
		    		} else if (member.getScore1() == 11) {
	    				UI.sendWinner(member.getName1());
	    				loop = false;
	    			} else if (member.getScore2() == 11) {
	    				UI.sendWinner(member.getName2());
	    				loop = false;
	    			}
			    }
		    }	//while
		}

}


















