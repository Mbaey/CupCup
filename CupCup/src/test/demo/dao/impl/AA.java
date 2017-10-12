package demo.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.dbutils.QueryRunner;
import org.junit.Test;

import utils.JDBCUtils;

public class AA {

	@Test
	public void testMain() throws SQLException{
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());

		String sql = "insert into category (name ,level) values ";

		String[] tags = { "剧情", "爱情", "喜剧", "科幻", "动作", "悬疑", "犯罪", "恐怖", "青春",
				"励志", "战争", "文艺", "黑色", "幽默", "传记", "情色", "暴力", "音乐", "家庭" };
		Object obj[] = new Object[tags.length * 2];
		int i = 0;
		for (String tag : tags) {
			sql += "(?, ?),";
			obj[i++] = tag;
			obj[i++] = (int) (Math.random() * 9 + 1);
		}
		String sql1 = sql.substring(0, sql.length() - 1);
		int res = qr.update(sql1, obj);
		// 归还给池
		System.out.println(res);
	}
	
	@Test
	public void testDate(){
		long t = 1501036636566L;
		long t1 = 1501034998103L;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(sdf.format(new Date(t)));
		System.out.println(new Date(t1));
	}
}
