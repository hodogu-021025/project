package com.test.java.ui;

public class UI {
	
	public static void mainTitle() {
		
		System.out.println();
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("    🏓 탁구 🏓");
	
	}
	
	public static void mainMenu() {
		
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("   🔸선수 등록🔸");
		System.out.println("   🔸선수 목록🔸");
		System.out.println("   🔸게임 시작🔸");
		System.out.println("   🔸점수 현황🔸");
		System.out.println("   🔸선수 리셋🔸");
		System.out.println();
		System.out.println("   🔸메뉴 종료🔸");
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		
	}
		
	public static void sendMessage(String txt) {
		System.out.println();
		System.out.printf("🔔 " + txt);
	}
	
	public static void sendWarning(String txt) {
		System.out.println();
		System.out.printf("❌ " + txt);
	}
	
	public static void sendWinner(String txt) {
		System.out.println();
		System.out.println("              🏆");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("===============================");
		System.out.printf(" " + txt + " 선수가 승리하였습니다!!");
		System.out.println();
		System.out.println("===============================");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
	}
	
	public static void listUI() {
		
		System.out.println();
		System.out.println("       🔸선수 목록🔸");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■");
		
	}
	
	public static void scoreUI() {
		
		System.out.println();
		System.out.println("    🔸점수 현황🔸");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■");
		
	}
	
	public static void startUI() {
		
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("""
				
				■■■■
				   ■
				■■■■
				   ■
				■■■■
				
				■■■■
				   ■
				■■■■
				■
				■■■■
				
				  ■
				■■■
				  ■
				  ■
				■■■■■
			""");
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println();
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("   🏓 게임 시작");
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println();
		
	}
}
