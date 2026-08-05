package com.test.java.app;

import java.util.Scanner;

import com.test.java.service.Service;
import com.test.java.ui.UI;

public class App {
		
	public static void main(String[] args) {
		
		boolean loop = true;
		
		while (loop) {
		Scanner scan = new Scanner(System.in);

		UI.mainTitle();
		UI.mainMenu();
		
		String input = scan.nextLine();
		switch (input) {
			case "선수 등록", "선수등록" -> Service.playerAdd();
			case "선수 목록", "선수목록" -> Service.playerList();
			case "점수 현황", "점수현황" -> Service.scoreList();
			case "세트 설정", "세트설정" -> Service.roundSet();
			case "게임 시작", "게임시작" -> Service.gameStart();
			case "선수 리셋", "선수리셋" -> Service.playerReset();
			case "메뉴 종료", "메뉴종료" -> {
				UI.sendMessage("메뉴를 종료하였습니다.");
				loop = false;
			}
			default -> UI.sendWarning("메뉴명을 입력해주세요.");
			}
		}

		
	}
		
}