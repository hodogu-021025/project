package com.test.java.service;

import java.util.List;
import java.util.Scanner;

import com.test.java.data.Data;
import com.test.java.member.Member;
import com.test.java.ui.UI;

public class gameService {

	public static void gameRunningSingle() {
	    Data data = new Data();
	    List<Member> list = data.list();
	    Member member = list.get(0);
	    
	    Scanner scan = new Scanner(System.in);
	    boolean loop = true;

	    while (loop) {
	        int s1 = member.getScore1();
	        int s2 = member.getScore2();

	        boolean isNormalWin1 = (s1 == 11 && s2 < 10);
	        boolean isNormalWin2 = (s2 == 11 && s1 < 10);

	        boolean isDeuceWin1 = (s1 >= 10 && s2 >= 10) && (s1 - s2 == 2);
	        boolean isDeuceWin2 = (s1 >= 10 && s2 >= 10) && (s2 - s1 == 2);

	        int round = member.getSetscore1() + member.getSetscore1() + 1;
	        
	        // 1번 선수 세트 승리
	        if (isNormalWin1 || isDeuceWin1) {
	        	member.setSetscore1(member.getSetscore1() + 1);
	            member.setScore1(0);
	            member.setScore2(0);
	            data.saveFile(member);
	            
	            // 최종 우승 
	            if (member.getSetscore1() == 1) { 
	                UI.sendFinalWinner(member.getName1());
	                loop = false;
	            } else {
	                menuService.scoreList();
	            }
	            continue;
	        }

	        // 2번 선수 세트 승리
	        if (isNormalWin2 || isDeuceWin2) {
	            member.setSetscore2(member.getSetscore2() + 1);
	            member.setScore1(0);
	            member.setScore2(0);
	            data.saveFile(member);
	            
	            // 최종 우승 
	            if (member.getSetscore2() == 1) { 
	                UI.sendFinalWinner(member.getName2());
	                loop = false;
	            } else {
	            	menuService.scoreList();
	            }
	            continue; 
	        }

	        if (s1 >= 10 && s2 >= 10 && s1 == s2) {
	            UI.duceUI();
	        }

	        System.out.print("🔥 득점한 선수: ");
	        String player = scan.next();

	        if (player.equals(member.getName1())) {
	            member.setScore1(member.getScore1() + 1);
	            UI.sendMessage(member.getName1() + " 선수 득점!!\r\n");
	            data.saveFile(member);
	            menuService.scoreList();
	        } else if (player.equals(member.getName2())) {
	            member.setScore2(member.getScore2() + 1);
	            UI.sendMessage(member.getName2() + " 선수 득점!!\r\n");
	            data.saveFile(member);
	            menuService.scoreList();
	        } else {
	            UI.sendWarning("선수의 이름을 정확히 입력하세요\r\n");
	        }
	    } // while
	}
	public static void gameRunningThree() {
		Data data = new Data();
		List<Member> list = data.list();
		Member member = list.get(0);
		
		Scanner scan = new Scanner(System.in);
		boolean loop = true;
		
		while (loop) {
			int s1 = member.getScore1();
			int s2 = member.getScore2();
			
			boolean isNormalWin1 = (s1 == 11 && s2 < 10);
			boolean isNormalWin2 = (s2 == 11 && s1 < 10);
			
			boolean isDeuceWin1 = (s1 >= 10 && s2 >= 10) && (s1 - s2 == 2);
			boolean isDeuceWin2 = (s1 >= 10 && s2 >= 10) && (s2 - s1 == 2);
			
			int round = member.getSetscore1() + member.getSetscore1() + 1;
			
			// 1번 선수 세트 승리
			if (isNormalWin1 || isDeuceWin1) {
				UI.sendWinner(member.getName1(), round);
				member.setSetscore1(member.getSetscore1() + 1);
				member.setScore1(0);
				member.setScore2(0);
				data.saveFile(member);
				
				// 최종 우승 
				if (member.getSetscore1() == 1) { 
					UI.sendFinalWinner(member.getName1());
					loop = false;
				} else {
					menuService.scoreList();
				}
				continue;
			}
			
			// 2번 선수 세트 승리
			if (isNormalWin2 || isDeuceWin2) {
				UI.sendWinner(member.getName2(), round);
				member.setSetscore2(member.getSetscore2() + 1);
				member.setScore1(0);
				member.setScore2(0);
				data.saveFile(member);
				
				// 최종 우승 
				if (member.getSetscore2() == 2) { 
					UI.sendFinalWinner(member.getName2());
					loop = false;
				} else {
					menuService.scoreList();
				}
				continue; 
			}
			
			if (s1 >= 10 && s2 >= 10 && s1 == s2) {
				UI.duceUI();
			}
			
			System.out.print("🔥 득점한 선수: ");
			String player = scan.next();
			
			if (player.equals(member.getName1())) {
				member.setScore1(member.getScore1() + 1);
				UI.sendMessage(member.getName1() + " 선수 득점!!\r\n");
				data.saveFile(member);
				menuService.scoreList();
			} else if (player.equals(member.getName2())) {
				member.setScore2(member.getScore2() + 1);
				UI.sendMessage(member.getName2() + " 선수 득점!!\r\n");
				data.saveFile(member);
				menuService.scoreList();
			} else {
				UI.sendWarning("선수의 이름을 정확히 입력하세요\r\n");
			}
		} // while
	}
	
	public static void gameStart() {
		
		Data data = new Data();
	    List<Member> list = data.list();
		
	    Member member = list.get(0);
	    
	    // 세트 미설정 예외 처리
	    if (menuService.roundType.equals("")) {
	    	
	    	UI.sendWarning("세트를 설정하세요.");
	    	
    	// 단판 승부
	    } else if (menuService.roundType.equals("단판 승부")) {
	    	
    	UI.startUI(menuService.roundType);
    	
    	if (member.getName1().equals("등록된 선수가 없습니다!")||member.getName2().equals("등록된 선수가 없습니다!")) {
	        UI.sendWarning("등록된 선수가 없습니다!");
	    } else {
	    	gameRunningSingle();
	    }
    	
    	// 3판 2선승
	    } else if (menuService.roundType.equals("3판 2선승")) {
	    	UI.startUI(menuService.roundType);
	    if (member.getName1().equals("등록된 선수가 없습니다!")||member.getName2().equals("등록된 선수가 없습니다!")) {
	        UI.sendWarning("등록된 선수가 없습니다!");
	    } else {
	    	gameRunningThree();
	    }
	}
}
	
	
}
