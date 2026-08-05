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
		
		public static void playerList() {
			
			UI.listUI();
		    
		    Data data = new Data();
		    List<Member> list = data.list();
		    
		    if (list.isEmpty()) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		        for (Member member : list) {
		            System.out.printf("1번 선수 이름: %s  점수: %d\r\n", member.getName1(), member.getScore1());
		            System.out.printf("2번 선수 이름: %s  점수: %d\r\n", member.getName2(), member.getScore2());
		        }
		    }
		}
		
		public static void scoreAdd() {
			System.out.print("득점한 선수: ");
			Scanner scan = new Scanner(System.in);
			String player = scan.next();
			
			Data data = new Data();
		    List<Member> list = data.list();
			
		    Member member = list.get(0);
		    
		    boolean loop = true;
		    
		    while (loop) {
		    	if (member.getScore1() < 11 ^ member.getScore2() < 11) {
		    		if (player.equals(member.getName1())) {
		    			member.setScore1(member.getScore1() + 1);
		    			UI.sendMessage(member.getName1() + " 선수 득점!");
		    		} else if (player.equals(member.getName2())) {
		    			member.setScore1(member.getScore2() + 1);
		    			UI.sendMessage(member.getName2() + " 선수 득점!");
		    		}
		    	} else if (member.getScore1() == 11) {
		    		UI.sendMessage(member.getName1() + " 선수가 승리하였습니다!!");
		    	} else if (member.getScore2() == 11) {
		    		UI.sendMessage(member.getName2() + " 선수가 승리하였습니다!!");
		    	}
		    }
			int result = data.saveFile(member);
		}
}
















