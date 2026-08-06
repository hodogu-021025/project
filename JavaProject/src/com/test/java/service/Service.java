package com.test.java.service;

import java.util.List;
import java.util.Scanner;

import com.test.java.data.Data;
import com.test.java.member.Member;
import com.test.java.ui.UI;


public class Service {
	
	static String roundType = "";
	
		public static void delay(int miliSec) {
			try {
			Thread.sleep(miliSec);
			} catch (Exception e) {}
		}
	
	
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
			int setscore1 = 0;
			int setscore2 = 0;
			
			Member member = new Member(name1, name2, score1, score2, setscore1, setscore2);
			
			int result = data.saveFile(member);
			if (result == 1) {
				UI.sendMessage("등록에 성공하였습니다!");
			} else {
				UI.sendWarning("등록에 실패하였습니다.");
			}
		}
		
		public static void allReset() {
		    
		    Data data = new Data();
		    List<Member> list = data.list();
		    Member member = list.get(0);
		    
		    member.setName1("등록된 선수가 없습니다!");
		    member.setName2("등록된 선수가 없습니다!");
		    member.setScore1(0);
		    member.setScore2(0);
		    member.setSetscore1(0);
		    member.setSetscore2(0);
		    int roundType = 0;
		    
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
		            System.out.printf("1번 선수: %s\r\n", member.getName1()
);
		            System.out.printf("2번 선수: %s\r\n", member.getName2());
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
		            System.out.printf("1. %s 선수 | 점수: %d | 세트 점수: %d\r\n"
		            		, member.getName1()
		            		, member.getScore1()
		            		, member.getSetscore1()
		            		);
		            System.out.printf("2. %s 선수 | 점수: %d | 세트 점수: %d\r\n"
		            		, member.getName2()
		            		, member.getScore2()
		            		, member.getSetscore2()
		            		);
		    		System.out.println();
		        }
		    }
		}
		
		public static void roundSet() {
			
			Data data = new Data();
			List<Member> list = data.list();
			Scanner scan = new Scanner(System.in);
			
			String round = null;

			UI.roundUI();

			boolean loop = true;
			while(loop) {
				
				String input = scan.nextLine();
				
				switch (input) {
				case "1" -> {
							round = "단판 승부";
							UI.sendMessage(round);
							loop = false;
							roundType = round;
							}
				case "2" -> {
							round = "3판 2선승";
							UI.sendMessage(round);
							loop = false;
							roundType = round;
							}
				default -> {
							UI.sendWarning("숫자 1, 2 중 하나를 입력해주세요.");
							UI.roundUI();
							}
				}
			}
		}
		
		
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
		                scoreList();
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
		                scoreList();
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
		            scoreList();
		        } else if (player.equals(member.getName2())) {
		            member.setScore2(member.getScore2() + 1);
		            UI.sendMessage(member.getName2() + " 선수 득점!!\r\n");
		            data.saveFile(member);
		            scoreList();
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
						scoreList();
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
						scoreList();
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
					scoreList();
				} else if (player.equals(member.getName2())) {
					member.setScore2(member.getScore2() + 1);
					UI.sendMessage(member.getName2() + " 선수 득점!!\r\n");
					data.saveFile(member);
					scoreList();
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
		    if (roundType.equals("")) {
		    	
		    	UI.sendWarning("세트를 설정하세요.");
		    	
	    	// 단판 승부
		    } else if (roundType.equals("단판 승부")) {
		    	
	    	UI.startUI(roundType);
	    	
	    	if (member.getName1().equals("등록된 선수가 없습니다!")||member.getName2().equals("등록된 선수가 없습니다!")) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		    	Service.gameRunningSingle();
		    }
	    	
	    	// 3판 2선승
		    } else if (roundType.equals("3판 2선승")) {
		    	UI.startUI(roundType);
		    if (member.getName1().equals("등록된 선수가 없습니다!")||member.getName2().equals("등록된 선수가 없습니다!")) {
		        UI.sendWarning("등록된 선수가 없습니다!");
		    } else {
		    	Service.gameRunningThree();
		    }
		}
	}
}


