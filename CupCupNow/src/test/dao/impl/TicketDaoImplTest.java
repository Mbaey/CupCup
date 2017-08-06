package dao.impl;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import bean.Ticket;
import dao.TicketDao;

public class TicketDaoImplTest {
	private TicketDao ticketDao = new TicketDaoImpl(); 
	@Test
	public void testInsertTicket() throws SQLException{
		Ticket ticket = new Ticket(new Timestamp(new Date().getTime()), new Timestamp(new Date().getTime()), 12, "wulong", 11, 56, 15);
		int res = ticketDao.insertTicket(ticket);
		System.out.println(res);
	}
	@Test
	public void testSelectTicketsWithu_idOrderByTime() throws SQLException{
		List<Ticket> res = ticketDao.selectTicketsWithu_idOrderByTime(1, 2);
		for(Ticket ticket: res)
		{
			System.out.println(ticket);
		}
	}
	

}
