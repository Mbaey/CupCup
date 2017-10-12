package utils;

import java.io.File;
import java.net.URL;

import org.apache.commons.io.FileUtils;


//http://www.jianshu.com/p/3e1ed28339df
public class DownloadURLFile  {
	public static String downloadFromUrl(String url,String dir) {  
	
	        try {  
	            URL httpurl = new URL(url);  
	            String fileName = getFileNameFromUrl(url);  
	            System.out.println(fileName);  
	            File f = new File(dir + fileName);  
	            //ÏÂÔØ´í org.apache.tomcat.util.http.fileupload.FileUtils°üÁË
	            //import org.apache.commons.io.FileUtils;  
	            FileUtils.copyURLToFile(httpurl, f);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	            return "Fault!";  
	        }   
	        return "Successful!";  
	    }
	
	public static String getFileNameFromUrl(String url){  
        String name = new Long(System.currentTimeMillis()).toString() + ".X";  
        int index = url.lastIndexOf("/");  
        if(index > 0){  
            name = url.substring(index + 1);  
            if(name.trim().length()>0){  
                return name;  
            }  
        }  
        return name;  
    }


}

