package utils;
/** 
 * �˹�����ֻ������Servlet 3.0 
 * Ϊ���ֲ� Servlet 3.0 �ļ��ϴ�ʱ��ȡ�ļ����͵��������� 
 *  
 * @author xiazdong 
 */  
import javax.servlet.http.*;  
public class UploadUtil{  
       public static String getFileType(Part p){  
              String name = p.getHeader("content-disposition");  
              String fileNameTmp = name.substring(name.indexOf("filename=")+10);  
              String type = fileNameTmp.substring(fileNameTmp.indexOf(".")+1,fileNameTmp.indexOf("\""));  
              return type;  
       }  
       public static String getFileName(Part p){  
              String name = p.getHeader("content-disposition");  
              String fileNameTmp = name.substring(name.indexOf("filename=")+10);  
              String fileNameTmp2 = name.substring(name.indexOf("filename="));  
              String fileName = fileNameTmp.substring(0,fileNameTmp.indexOf("\""));  
              return fileName;  
       }  
}  