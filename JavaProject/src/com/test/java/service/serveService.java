package com.test.java.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.test.java.data.Data;
import com.test.java.member.Member;
import com.test.java.ui.UI;

public class serveService {
	
	public static void ServeStart() {
		
		Data data = new Data();
		List<Member> list = data.list();
		Member member = list.get(0);
		
		menuService.playerList();
		
		boolean loop = true;
		
		while (loop) {
			Scanner scan = new Scanner(System.in);
	
			System.out.print(" ▶ 서브권을 가진 선수의 번호: ");
			String playerNum = scan.nextLine();
			
			switch (playerNum) {
				case "1","1번" -> {
					Serve(1);
					loop = false;
				}
				case "2","2번" -> {
					Serve(2);
					loop = false;
				}
				default -> UI.sendWarning("선수의 번호를 입력해주세요.");
				}
		}
	}
	
	
	public static int serveNum;
	
	public static void Serve(int playerNum) {
		
		Data data = new Data();
		List<Member> list = data.list();
		Member member = list.get(0);
		
		serveNum = playerNum;
		if (playerNum == 1) {
			UI.sendMessage(member.getName1()+" 선수 서브입니다!\r\n");
		} else if (playerNum == 2) {
			UI.sendMessage(member.getName2()+" 선수 서브입니다!\r\n");
		} else {
			UI.sendWarning("선수의 번호를 입력해주세요.");
			
		}
	
	}
	
}
