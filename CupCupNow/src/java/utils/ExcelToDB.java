package utils;
import java.io.File;  
import java.io.FileInputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.text.SimpleDateFormat;  

import org.apache.poi.hssf.usermodel.HSSFWorkbook;  
import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.DateUtil;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.ss.usermodel.Sheet;  
import org.apache.poi.ss.usermodel.Workbook;  
import org.apache.poi.xssf.usermodel.XSSFWorkbook;  

public class ExcelToDB {
    private static final String EXCEL_XLS = "xls";  
    private static final String EXCEL_XLSX = "xlsx";  
    //�ж�Excel�İ汾,��ȡWorkbook 
    public static Workbook getWorkbok(InputStream in,File file) throws IOException{  
        Workbook wb = null;  
        if(file.getName().endsWith(EXCEL_XLS)){  //Excel 2003  
        wb = new HSSFWorkbook(in);  
        }else if(file.getName().endsWith(EXCEL_XLSX)){  // Excel 2007/2010  
            wb = new XSSFWorkbook(in);  
        }  
        return wb;  
    }  

    //�ж��ļ��Ƿ���excel 
    public static void checkExcelVaild(File file) throws Exception{  
        if(!file.exists()){  
            throw new Exception("�ļ�������");  
        }  
        if(!(file.isFile() && (file.getName().endsWith(EXCEL_XLS) || file.getName().endsWith(EXCEL_XLSX)))){  
            throw new Exception("�ļ�����Excel");  
        }  
    }  

    //��ָ����Sheet������List 
    public static void exportListFromExcel() throws IOException {  

    SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");  
     try {  
            // ͬʱ֧��Excel 2003��2007  
            File excelFile = new File("D:/123.xls"); // �����ļ�����  
            FileInputStream is = new FileInputStream(excelFile); // �ļ���  
            checkExcelVaild(excelFile);  
            Workbook workbook = getWorkbok(is,excelFile);  
            //Workbook workbook = WorkbookFactory.create(is); // ���ַ�ʽ Excel2003/2007/2010���ǿ��Դ����  

            int sheetCount = workbook.getNumberOfSheets(); // Sheet������  
            /** 
             * ���õ�ǰexcel��sheet���±꣺0��ʼ 
             */  
            Sheet sheet = workbook.getSheetAt(0);   // ������һ��Sheet  

            // Ϊ������һ��Ŀ¼����count  
            int count = 0;  

            for (Row row : sheet) {  
                // ������һ�е�Ŀ¼  
                if(count == 0){  
                    count++;  
                    continue;  
                }  
                // �����ǰ��û�����ݣ�����ѭ��  
                if(row.getCell(0).toString().equals("")){  
                    return ;  
                }  
                String rowValue = "";  
                for (Cell cell : row) {  
                    if(cell.toString() == null){  
                        continue;  
                    }  
                    int cellType = cell.getCellType();  
                    String cellValue = "";  
                    switch (cellType) {  
                        case Cell.CELL_TYPE_STRING:     // �ı�  
                            cellValue = cell.getRichStringCellValue().getString() + "#";  
                            break;  
                        case Cell.CELL_TYPE_NUMERIC:    // ���֡�����  
                            if (DateUtil.isCellDateFormatted(cell)) {  
                                cellValue = fmt.format(cell.getDateCellValue()) + "#";  
                            } else {  
                                cell.setCellType(Cell.CELL_TYPE_STRING);  
                                cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";  
                            }  
                            break;  
                        case Cell.CELL_TYPE_BOOLEAN:    // ������  
                            cellValue = String.valueOf(cell.getBooleanCellValue()) + "#";  
                            break;  
                        case Cell.CELL_TYPE_BLANK: // �հ�  
                            cellValue = cell.getStringCellValue() + "#";  
                            break;  
                        case Cell.CELL_TYPE_ERROR: // ����  
                            cellValue = "����#";  
                            break;  
                        case Cell.CELL_TYPE_FORMULA:    // ��ʽ  
                            // �õ���Ӧ��Ԫ��Ĺ�ʽ  
                            //cellValue = cell.getCellFormula() + "#";  
                            // �õ���Ӧ��Ԫ����ַ���  
                            cell.setCellType(Cell.CELL_TYPE_STRING);  
                            cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";  
                            break;  
                        default:  
                            cellValue = "#";  
                    }  
                    //System.out.print(cellValue);  
                    rowValue += cellValue;  
                }    
                System.out.println(rowValue);  
                System.out.println();  
            }   
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally{    
        }  
    } 
}