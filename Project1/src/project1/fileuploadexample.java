package project1;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class fileuploadexample
  extends HttpServlet
{
  private static final String CONTENT_TYPE = "text/html; charset=UTF-8";

  public void init(ServletConfig config)
    throws ServletException
  {
    super.init(config);
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
    throws ServletException, IOException
  {
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                    if (isMultipart) {
                            // Create a factory for disk-based file items
                            FileItemFactory factory = new DiskFileItemFactory();

                            // Create a new file upload handler
                            ServletFileUpload upload = new ServletFileUpload(factory);
             
                        try {
                            // Parse the request
                            List /* FileItem */ items = upload.parseRequest(request);
                            Iterator iterator = items.iterator();
                            while (iterator.hasNext()) {
                                FileItem item = (FileItem) iterator.next();
                                if (!item.isFormField()) {
                                    String fileName = item.getName();        
                                    String root = getServletContext().getRealPath("/");
                                    File path = new File("/oracle/jdev_user_home/Uploads");
                                    if (!path.exists()) {
                                        boolean status = path.mkdirs();
                                    }
                                    System.out.println("fileName:" + fileName);
                                    File uploadedFile = new File(path + "/" + fileName);
                                    //System.out.println(uploadedFile.getAbsolutePath());
                                    item.write(uploadedFile);
                                    System.out.println("ok");
                                }
                            }
                        } catch (FileUploadException e) {
                            e.printStackTrace();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
  }
}
