package dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import utils.JDBCUtils;
import utils.MyConstant;
import bean.Ticket;
import dao.TicketDao;

public class TicketDaoImpl implements TicketDao{

	@Override
	public int insertTicket(Ticket ticket) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "insert into ticket values (?,?,?,?,?,?,?,?)";
		int res = qr.update(sql,ticket.getT_id(),ticket.getS_time(),ticket.getE_time(),
				ticket.getSeat_num(),ticket.getM_title(),ticket.getScene_id(),
				ticket.getU_id(),ticket.getPrice());
		return res;
	}

	@Override
	public List<Ticket> selectTicketsWithu_idOrderByTime(int u_id, int page)
			throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select *from ticket where u_id =? order by s_time asc limit ?,? ";
		List<Ticket> res = qr.query(sql, new BeanListHandler<Ticket>(Ticket.class), u_id, MyConstant.PAGE_SIZE*(page-1), MyConstant.PAGE_SIZE);
		return res;
		
	}

	@Override
	public Ticket selectTicketsWithu_id(int u_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "select *from ticket where u_id =?  ";
		Ticket res = qr.query(sql, new BeanHandler<Ticket>(Ticket.class), u_id);
		return res;
	}

	@Override
	public int deleteTicketsWithu_id(int u_id) throws SQLException {
		QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "delete from ticket where u_id =?  ";
		int res = qr.update(sql, u_id);
		return res;
	}
		

}
