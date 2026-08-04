package com.test.java.app;

import java.util.Scanner;

import com.test.java.service.Service;
import com.test.java.ui.UI;

public class App {
		
	public static void main(String[] args) {
		
		UI.mainTitle();
		
		Scanner scan = new Scanner(System.in);
		boolean loop = true;
			
		while (loop) {
			UI.mainMenu();
			System.out.printf("메뉴를 입력해주세요! ");
			String input = scan.nextLine();
			switch (input) {
				case "게임 시작" -> Service.playerAdd();
				case "게임시작" -> Service.playerAdd();
				case "경기 결과" -> UI.sendMessage("개발중...");
				case "경기결과" -> UI.sendMessage("개발중...");
				case "메뉴 종료" -> {
				UI.sendMessage("메뉴를 종료하였습니다.");
				loop = false;
				}
				case "메뉴종료" -> {
					UI.sendMessage("메뉴를 종료하였습니다.");
					loop = false;
				}
				default -> UI.sendMessage("메뉴명을 입력해주세요.");
			}
		}
	}
		
}
	
