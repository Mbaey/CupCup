package service.impl;

import java.sql.SQLException;
import java.util.List;

import dao.BoxOfficeDao;
import dao.impl.BoxOfficeDaoImpl;
import bean.BoxOffice;
import service.BoxOfficeService;

public class BoxOfficeServiceImpl implements BoxOfficeService{

	private BoxOfficeDao boxOfficeDao = new BoxOfficeDaoImpl(); 
	@Override
	public List<BoxOffice> selectAllBoxOffices() throws SQLException {
		return boxOfficeDao.selectAllBoxOffices();
	}

}
