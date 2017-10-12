package dao;

import java.sql.SQLException;

import bean.Comment;
import bean.Mgr;

public interface MgrDao {
	/**
	 * 管理员就可以新增吧。忘了密码再开一个管理员用户~
	 * @param mgr
	 * @return
	 * @throws SQLException
	 */
	int insertMgr(Mgr mgr) throws SQLException;
}
