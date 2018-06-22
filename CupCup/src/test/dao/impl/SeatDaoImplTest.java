package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.junit.Test;

import com.alibaba.fastjson.JSONObject;

public class SeatDaoImplTest {
	SeatDaoImpl seatDao = new SeatDaoImpl();
	@Test
	public void test() throws SQLException{
	     int res = seatDao.insertSeat(5, 1);
	     System.out.println(res);
	}
	
	@Test
	public void test2() throws SQLException{
		
		List<Integer> res = seatDao.selectSeat(1);
		JSONObject jsonObject = new JSONObject();
		int m = 0;
		for(Integer tep:res){
			jsonObject.put("zuo"+m, tep);
			m++;
		}
		String st = jsonObject.toString();
		String st2 = st.replaceAll("\"", "\\\"");
		System.out.println(st);
		System.out.println(st2);
	}
	
	@Test
	public void test3() throws SQLException{
		
	}
	
}
