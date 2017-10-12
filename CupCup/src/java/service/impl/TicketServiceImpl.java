package service.impl;

import java.sql.SQLException;
import java.util.List;

import bean.Ticket;
import dao.TicketDao;
import dao.impl.TicketDaoImpl;
import service.TicketService;

public class TicketServiceImpl implements TicketService {
	TicketDao tickDao = new TicketDaoImpl();

	@Override
	public int insertTicket(Ticket ticket) throws SQLException {
		return tickDao.insertTicket(ticket);
		
	}

	@Override
	public List<Ticket> selectTicketsWithu_idOrderByTime(int u_id, int page) throws SQLException {
		return tickDao.selectTicketsWithu_idOrderByTime(u_id, page);
		
	}

	@Override
	public Ticket selectTicketsWithu_id(int u_id) throws SQLException {
		return tickDao.selectTicketsWithu_id(u_id);
		
	}

	@Override
	public int deleteTicketsWithu_id(int u_id) throws SQLException {
		return tickDao.deleteTicketsWithu_id(u_id);
		
	}

}
