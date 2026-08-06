package com.test.java.ui;

import com.test.java.service.Service;

public class UI {
	
	public static void mainTitle() {
		
		System.out.println();
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("    🏓 탁구 🏓");
	
	}
	
	public static void mainMenu() {
		
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.println("   ▶️ 선수 등록 ◀️");
		System.out.println("   ▶️ 세트 설정 ◀️");
		System.out.println("   ▶️ 게임 시작 ◀️");
		System.out.println();
		System.out.println("   ▶️ 선수 목록 ◀️");
		System.out.println("   ▶️ 점수 현황 ◀️");
		System.out.println("   ▶️ 전체 리셋 ◀️");
		System.out.println();
		System.out.println("   🔸메뉴 종료🔸");
		System.out.println("■■■■■■■■■■■■■■■■■■■■");
		System.out.print("입력 ▶ ");
		
	}
		
	public static void sendMessage(String txt) {
		System.out.println();
		System.out.printf("🔔 " + txt);
		System.out.println();
	}
	
	public static void sendWarning(String txt) {
		System.out.println();
		System.out.printf("❌ " + txt);
		System.out.println();
	}
	
	public static void sendWinner(String txt, int setscore) {
		System.out.println();
		System.out.println("              🏓");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("===============================");
		System.out.println("          << " + setscore + " 세트 >>");
		System.out.printf(" " + txt + " 선수가 승리하였습니다!!");
		System.out.println();
		System.out.println("===============================");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println();
	}
	
	public static void sendFinalWinner(String txt) {
		System.out.println();
		System.out.println("✨  ✨ ✨ ✨ 🏆 ✨ ✨ ✨  ✨");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println("==============================");
		System.out.println();
		System.out.printf("        ▶️ %s 선수 ◀️\r\n", txt);
		System.out.printf("         🔥최종 승리🔥\r\n");
		System.out.println();
		System.out.println("==============================");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		System.out.println();
	}
	
	
	public static void roundUI() {
		
		 System.out.println();
		 System.out.println(" 세트 선택");
		 System.out.println("■■■■■■■■■■■■");
		 System.out.println(" 1. 단판");
		 System.out.println(" 2. 3판 2선");
		 System.out.println("■■■■■■■■■■■■");
		 System.out.print("입력 ▶ ");
		
	}
	
	public static void listUI() {
		
		System.out.println();
		System.out.println(" 🔸선수 목록🔸");
		System.out.println("■■■■■■■■■■■■■■■■");
		
	}
	
	public static void scoreUI() {
		
		System.out.println();
		System.out.println("            🔸점수 현황🔸");
		System.out.println("■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■");
		
	}
	
	public static void startUI(String roundType) {
		
		System.out.println("""
				
				■■■■
				   ■
				■■■■
				   ■
				■■■■
				
			""");
		Service.delay(1000);
		System.out.println("""
				■■■■
				   ■
				■■■■
				■
				■■■■
				
			""");
		Service.delay(1000);
		System.out.println("""
				  ■
				■■■
				  ■
				  ■
				■■■■■
				
			""");
		System.out.println();
		Service.delay(1000);
		System.out.println("  ■■■■■■■■■■■■■■■■");
		System.out.println("    🏓 게임 시작");
		System.out.println();
		System.out.printf("     ▶ %s\r\n", roundType);
		System.out.println("  ■■■■■■■■■■■■■■■■");
		System.out.println();
		
	}
	
	public static void duceUI() {
		
		System.out.println();
		System.out.println("  🏓 듀스 🏓");
		System.out.println();
		
	}
	
	
}
