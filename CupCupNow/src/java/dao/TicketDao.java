package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Ticket;

public interface TicketDao {
	/**
	 * �ٹ�Ʊ����ѡ����
	 * ����Ʊ����Ϣ��Ȼ��Ͳ��룬
	 * �����޸�
	 * @param ticket
	 * @return
	 * @throws SQLException
	 */
	int insertTicket(Ticket ticket) throws SQLException;
	
	/**
	 * ������Ϣ����
	 * ���Է�ҳ���ҵ� ��Ʊ�����м�¼
	 * @param u_id
	 * @return
	 * @throws SQLException
	 */
	List<Ticket> selectTicketsWithu_idOrderByTime(int u_id, int page) throws SQLException;
	Ticket selectTicketsWithu_id(int u_id) throws SQLException;
	int deleteTicketsWithu_id(int u_id) throws SQLException;
	
	
}
