package com.test.java.data;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import com.test.java.member.Member;

public class Data {

	private final static String MEMBER_PATH;
	
	static {
		MEMBER_PATH = ".\\data\\member.txt";
	}
	
	public int saveFile(Member entity) {
		
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(MEMBER_PATH, false))) {
        	
        	writer.write(String.format("%s,%d,%d\r\n%s,%d,%d"
        			, entity.getName1()
        			, entity.getScore1()
        			, entity.getSetscore1()
		        	, entity.getName2()
		        	, entity.getScore2()
		        	, entity.getSetscore2()));
        	
        	return 1;
        	
        } catch (Exception e) {
        	e.printStackTrace();
        }
        
        return 0;
        
	}
	
	public List<Member> list() {
		List<Member> list = new ArrayList<Member>();
		
		try (BufferedReader reader = new BufferedReader(new FileReader(MEMBER_PATH))) {
			
			String line = null;
			
			while ((line = reader.readLine()) != null) {
				
				String[] temp1 = line.split(",");
                String name1 = temp1[0].trim();
                int score1 = Integer.parseInt(temp1[1].trim());
                int setscore1 = Integer.parseInt(temp1[2].trim());
                
                String line2 = reader.readLine();
                if (line2 == null) break;
                
                String[] temp2 = line2.split(",");
                String name2 = temp2[0].trim();
                int score2 = Integer.parseInt(temp2[1].trim());
                int setscore2 = Integer.parseInt(temp2[2].trim());
				
				Member entity = new Member(name1, name2, score1, score2, setscore1, setscore2);
				list.add(entity);
			}
			
		} catch (Exception e) {
			e.printStackTrace();			
		}
		
		return list;
	}
	
}
