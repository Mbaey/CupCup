package dao;

import java.sql.SQLException;

import bean.Comment;
import bean.Mgr;

public interface MgrDao {
	/**
	 * ����Ա�Ϳ��������ɡ����������ٿ�һ������Ա�û�~
	 * @param mgr
	 * @return
	 * @throws SQLException
	 */
	int insertMgr(Mgr mgr) throws SQLException;
}
