<%@ page contentType="text/html; charset=utf-8"%>
<%
	out.clear();
	out.print("<?xml version='1.0' encoding='utf-8' ?>");
	response.setContentType("text/xml; charset=utf-8");

	String actionName = request.getParameter("actionName");
	boolean success = false;
	int code = -1;
	String message = "";
	
	/** SAMPLE SETTING 업무시스템에서 구현할 추가 로그인 처리 과정 (시작)*/
	try{
		
		// 테스트용 세션 value 생성
		session.setAttribute("DUMMY1","AAAAA");
		session.setAttribute("DUMMY2","BBBBB");
		
		/***************************
		1. 성공시 
		code = 0
		success = true 로 세팅
		
		2. 에러시
		message = e.getMessage(); 에러 메시지
		code = 정의된 에러코드있으면 세팅
		***************************/
		code = 0;                 
		success = true;
	}catch(Exception e){
		message = e.getMessage();
		code = -99999; // ex
	} 
	/** SAMPLE SETTING 업무시스템에서 구현할 추가 로그인 처리 과정 (끝)*/
%>

<MagicSSO>
	<actionName><%=actionName%></actionName>
	<success><%=success%></success>
	<code><%=code%></code>
	<message><![CDATA[<%=message%>]]></message>
</MagicSSO>