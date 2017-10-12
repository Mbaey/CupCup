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

	// 判断Excel的版本,获取Workbook
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

	// 判断文件是否是excel
	public static void checkExcelVaild(File file) throws Exception {
		if (!file.exists()) {
			throw new Exception("文件不存在");
		}
		if (!(file.isFile() && (file.getName().endsWith(EXCEL_XLS) || file
				.getName().endsWith(EXCEL_XLSX)))) {
			throw new Exception("文件不是Excel");
		}
	}

	// 由指定的Sheet导出至List
	public static void insertExcel(String file) throws IOException {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		try {
			// 同时支持Excel 2003、2007
			File excelFile = new File(file); // 创建文件对象
			FileInputStream is = new FileInputStream(excelFile); // 文件流
			checkExcelVaild(excelFile);
			Workbook workbook = getWorkbok(is, excelFile);
			// Workbook workbook = WorkbookFactory.create(is); // 这种方式
			// Excel2003/2007/2010都是可以处理的

			int sheetCount = workbook.getNumberOfSheets(); // Sheet的数量
			/**
			 * 设置当前excel中sheet的下标：0开始
			 */
			Sheet sheet = workbook.getSheetAt(0); // 遍历第一个Sheet

			// 为跳过第一行目录设置count
			int count = 0;

			for (Row row : sheet) {
				// 跳过第一行的目录
				if (count == 0) {
					count++;
					continue;
				}
				// 如果当前行没有数据，跳出循环
				if (row.getCell(0).toString().equals("")) {
					return;
				}
				String rowValue = "";
				for (Cell cell : row) {
					if (cell.toString() == null) {
						continue;
					}
					/**
					 * 日期的toString()不知道为什么输出的格式不对 2017-七月-28
					 */
					// System.out.println("***" + cell.toString());
					int cellType = cell.getCellType();
					String cellValue = "";
					switch (cellType) {
					case Cell.CELL_TYPE_STRING: // 文本
						cellValue = cell.getRichStringCellValue().getString()
								+ "#";
						break;
					case Cell.CELL_TYPE_NUMERIC: // 数字、日期
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
					case Cell.CELL_TYPE_BOOLEAN: // 布尔型
						cellValue = String.valueOf(cell.getBooleanCellValue())
								+ "#";
						break;
					case Cell.CELL_TYPE_BLANK: // 空白
						cellValue = cell.getStringCellValue() + "#";
						break;
					case Cell.CELL_TYPE_ERROR: // 错误
						cellValue = "错误#";
						break;
					case Cell.CELL_TYPE_FORMULA: // 公式
						// 得到对应单元格的公式
						// cellValue = cell.getCellFormula() + "#";
						// 得到对应单元格的字符串
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
				
				//默认是采用这种格式
				//不然就不要用excel读取了
				// m_id m_title 	date	 time		 type 	hall_id	 price
				// 14462 阿唐奇遇 2017-7-26    14:10-16:23       国语2D     1 	 25.5

				// 战狼2#2017-07-26#19:20???21:33#国语2D#1#25.5#
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
