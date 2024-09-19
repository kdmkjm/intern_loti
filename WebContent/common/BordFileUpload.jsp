<%@page import="org.apache.taglibs.standard.tag.common.core.CatchTag"%>
<%@page import="java.util.Iterator"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.io.*,
    				java.util.List,
    				java.util.ArrayList,
    				fw.nexti.util.FileManager,
    				javax.servlet.ServletContext,
    				fw.nexti.util.Utils,
    				org.apache.struts.upload.FormFile,
    				javax.servlet.http.*,
    				org.apache.commons.fileupload.*
    				" %>
<%
final String DQM = "\"";

String task = (String)request.getAttribute("task");
String boardType = (String)request.getAttribute("bordType");
PrintWriter res = response.getWriter();
if(task.equals("tmpUpload")){
	ServletContext sContext = getServletContext();
	
	//저장할 디렉토리 지정
	String saveDir = "/WEB-INF/datafile/"+boardType+"/";
	File saveFolder = new File(sContext.getRealPath(saveDir));
	if(!saveFolder.exists()) {
		saveFolder.mkdirs();
	}
	String fname = "";
	String newFileName = "";
	long size = 0;
	//파일업로드
	try{
		DefaultFileItemFactory factory = new DefaultFileItemFactory();
		
		FileUpload upload = new FileUpload(factory);
		List<FileItem> items = upload.parseRequest(request);
		Iterator iter = items.iterator();
		while(iter.hasNext()){
			FileItem fileItem = (FileItem)iter.next();
			if(fileItem.isFormField()){
				// 일반 폼필드
			}
			else{
				if(fileItem.getSize() > 0)
				{
					InputStream stream = null;
					OutputStream bos = null;
					try{
						 stream = fileItem.getInputStream();
						fname = fileItem.getName();
						// 저장할 파일명 자동생성
						newFileName = String.valueOf(System.currentTimeMillis())
								+ String.valueOf((int) (Math.random() * 1000))
								+ Utils.getFileExtension(fname);
						size = fileItem.getSize();
						
						// 파일을 업로드할 절대 경로를 지정해야 한다.
						bos = new FileOutputStream(saveFolder+ File.separator + newFileName);
						int bytesRead = 0;
						int uploadedByte = 0;
						byte[] buffer = new byte[8192];
						while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
							bos.write(buffer, 0, bytesRead);
							uploadedByte += bytesRead;
							session.setAttribute("item", fileItem.getName());
							session.setAttribute("percent", (uploadedByte/size) * 100);
						}
					}
					catch(Exception e){
						e.printStackTrace();
					}
					finally {
						try { bos.flush(); bos.close(); } catch (Exception e) {}
						try { stream.close(); } catch (Exception e) {}
						session.setAttribute("item", null);
						session.setAttribute("percent", 0);
					}
				}
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	// jsonString
	StringBuilder json = new StringBuilder();
	json.append("{");
	json.append(DQM).append("rname").append(DQM).append(":").append(DQM).append(newFileName).append(DQM);
	json.append(DQM).append("size").append(DQM).append(":").append(DQM).append(size).append(DQM);
	json.append(DQM).append("fname").append(DQM).append(":").append(DQM).append(fname).append(DQM);
	json.append("}");
	res.print(json.toString());
}
%>