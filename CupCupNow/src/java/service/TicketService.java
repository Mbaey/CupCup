package service;

import java.sql.SQLException;
import java.util.List;

import bean.Ticket;

public interface TicketService {
int insertTicket(Ticket ticket) throws SQLException;
	
	/**
	 * 个人信息界面
	 * 可以分页查找到 购票的所有记录
	 * @param u_id
	 * @return
	 * @throws SQLException
	 */
	List<Ticket> selectTicketsWithu_idOrderByTime(int u_id, int page) throws SQLException;
	Ticket selectTicketsWithu_id(int u_id) throws SQLException;
	int deleteTicketsWithu_id(int u_id) throws SQLException;

}
