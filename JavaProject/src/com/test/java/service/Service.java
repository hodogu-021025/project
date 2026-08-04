package com.test.java.service;

import java.util.List;
import java.util.Scanner;

import com.test.java.data.Data;

public class Service {
		public static void playerAdd() {
			System.out.print("1번 선수의 이름: ");
			try (Scanner scan = new Scanner(System.in)) {
				String name1 = scan.next();
				System.out.println();
				System.out.printf("✅1번 선수 %s 등록\r\n", name1);
				System.out.println();
				
				System.out.print("2번 선수의 이름: ");
				String name2 = scan.next();
				System.out.println("");
				System.out.printf("✅2번 선수 %s 등록\r\n", name2);
				System.out.println("");
			}
			
			Data data = new Data();
			
			List<Member> list = data.list();
			
		}
}


