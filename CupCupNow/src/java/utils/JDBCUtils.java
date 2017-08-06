package utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JDBCUtils {
	// �����ļ���Ĭ�����ã�Ҫ����������c3p0-config.xml������
    private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

    /**
     * ʹ�����ӳط���һ�����Ӷ���
     * @return
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException{
        return dataSource.getConnection();
    }

    /**
     * �������ӳض���
     * @return
     */
    public static DataSource getDataSource() {
        return dataSource;
    }
}
