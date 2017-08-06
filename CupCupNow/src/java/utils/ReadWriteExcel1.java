package utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.Test;

import service.impl.SceneServiceImpl;
import bean.Scene;

public class ReadWriteExcel1 {
	private static final String EXCEL_XLS = "xls";
	private static final String EXCEL_XLSX = "xlsx";

	// �ж�Excel�İ汾,��ȡWorkbook
	public static Workbook getWorkbok(InputStream in, File file)
			throws IOException {
		Workbook wb = null;
		if (file.getName().endsWith(EXCEL_XLS)) { // Excel 2003
			wb = new HSSFWorkbook(in);
		} else if (file.getName().endsWith(EXCEL_XLSX)) { // Excel 2007/2010
			wb = new XSSFWorkbook(in);
		}
		return wb;
	}

	// �ж��ļ��Ƿ���excel
	public static void checkExcelVaild(File file) throws Exception {
		if (!file.exists()) {
			throw new Exception("�ļ�������");
		}
		if (!(file.isFile() && (file.getName().endsWith(EXCEL_XLS) || file
				.getName().endsWith(EXCEL_XLSX)))) {
			throw new Exception("�ļ�����Excel");
		}
	}

	// ��ָ����Sheet������List
	public static void insertExcel(String file) throws IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			// ͬʱ֧��Excel 2003��2007
			File excelFile = new File(file); // �����ļ�����
			FileInputStream is = new FileInputStream(excelFile); // �ļ���
			checkExcelVaild(excelFile);
			Workbook workbook = getWorkbok(is, excelFile);
			// Workbook workbook = WorkbookFactory.create(is); // ���ַ�ʽ
			// Excel2003/2007/2010���ǿ��Դ����

			int sheetCount = workbook.getNumberOfSheets(); // Sheet������
			/**
			 * ���õ�ǰexcel��sheet���±꣺0��ʼ
			 */
			Sheet sheet = workbook.getSheetAt(0); // ������һ��Sheet

			// Ϊ������һ��Ŀ¼����count
			int count = 0;

			for (Row row : sheet) {
				// ������һ�е�Ŀ¼
				if (count == 0) {
					count++;
					continue;
				}
				// �����ǰ��û�����ݣ�����ѭ��
				if (row.getCell(0).toString().equals("")) {
					return;
				}
				String rowValue = "";
				for (Cell cell : row) {
					if (cell.toString() == null) {
						continue;
					}
					/**
					 * ���ڵ�toString()��֪��Ϊʲô����ĸ�ʽ���� 2017-����-28
					 */
					// System.out.println("***" + cell.toString());
					int cellType = cell.getCellType();
					String cellValue = "";
					switch (cellType) {
					case Cell.CELL_TYPE_STRING: // �ı�
						cellValue = cell.getRichStringCellValue().getString()
								+ "#";
						break;
					case Cell.CELL_TYPE_NUMERIC: // ���֡�����
						if (DateUtil.isCellDateFormatted(cell)) {
							cellValue = fmt.format(cell.getDateCellValue())
									+ "#";
						} else {
							cell.setCellType(Cell.CELL_TYPE_STRING);
							cellValue = String.valueOf(cell
									.getRichStringCellValue().getString())
									+ "#";
						}
						break;
					case Cell.CELL_TYPE_BOOLEAN: // ������
						cellValue = String.valueOf(cell.getBooleanCellValue())
								+ "#";
						break;
					case Cell.CELL_TYPE_BLANK: // �հ�
						cellValue = cell.getStringCellValue() + "#";
						break;
					case Cell.CELL_TYPE_ERROR: // ����
						cellValue = "����#";
						break;
					case Cell.CELL_TYPE_FORMULA: // ��ʽ
						// �õ���Ӧ��Ԫ��Ĺ�ʽ
						// cellValue = cell.getCellFormula() + "#";
						// �õ���Ӧ��Ԫ����ַ���
						cell.setCellType(Cell.CELL_TYPE_STRING);
						cellValue = String.valueOf(cell
								.getRichStringCellValue().getString()) + "#";
						break;
					default:
						cellValue = "#";
					}
					// System.out.println(cellValue);
					rowValue += cellValue;
				}
				
				String[] split = rowValue.split("#");
				
				//Ĭ���ǲ������ָ�ʽ
				//��Ȼ�Ͳ�Ҫ��excel��ȡ��
				// m_id m_title 	date	 time		 type 	hall_id	 price
				// 14462 �������� 2017-7-26    14:10-16:23       ����2D     1 	 25.5

				// ս��2#2017-07-26#19:20???21:33#����2D#1#25.5#
				String[] time = split[3].split("-");
				String stime = split[2] + " " + time[0];
				String etime = split[2] + " " + time[1];
				Timestamp s_time = new Timestamp(sdf.parse(stime).getTime());
				Timestamp e_time = new Timestamp(sdf.parse(etime).getTime());
//				System.out.println(s_time);
//				System.out.println(e_time);
//				System.out.println(rowValue);
				Scene scene = new Scene(Integer.parseInt(split[0]), split[1], s_time, e_time,
						split[4], Integer.parseInt(split[5]),
						Float.parseFloat(split[6]));
				System.out.println(scene);
				SceneServiceImpl sceneServiceImpl = new SceneServiceImpl();
				sceneServiceImpl.insertScene(scene);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}
}
