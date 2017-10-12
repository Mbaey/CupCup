package utils;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import bean.Scene;
import bean.Scene2;

public class Exchange {
	public List<Scene2> change(List<Scene> list){
		List<Scene2> list2 = new ArrayList<Scene2>();
		for(Scene se:list){
			Timestamp time1 = se.getE_time();
			Timestamp time2 = se.getS_time();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm");
			String str1 = simpleDateFormat.format(time1);
			String str2 = simpleDateFormat.format(time2);
			list2.add(new Scene2(se.getHall_id(), se.getM_id(), se.getM_title(), str2, str1, se.getHall_id(), se.getPrice(), se.getType()));
			
		}
		
		return list2;
	}
}
