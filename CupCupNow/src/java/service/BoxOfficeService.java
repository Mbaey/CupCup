package service;

import java.sql.SQLException;
import java.util.List;

import bean.BoxOffice;

public interface BoxOfficeService {
	/**
	 * �õ�Ʊ������
	 * ���е���Ϣ
	 * @return
	 * @throws SQLException
	 */
	List<BoxOffice> selectAllBoxOffices()throws SQLException; 
}
