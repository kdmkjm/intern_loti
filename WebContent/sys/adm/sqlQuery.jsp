<%@page contentType="text/html;charset=euc-kr" %>
<%@ page language="java"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/c.tld" prefix="c" %>

<html> 
<head>
<title>Query form</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
   
<script language="JavaScript" src="/common/js/base64.js"></script>
<script language="javascript">
	//조회
	function querySubmit(frm)
	{	
		frm.target="_self";
		frm.query.value = base64Encode(encodeURIComponent(frm.query.value));
		//alert(decodeURIComponent(base64Decode(frm.query.value)));
		frm.action="<html:rewrite page="/sysSqlQuery.act"/>";
		frm.submit();
	}

	function queryexceldown(frm)
	{
		frm.target="actionFrame";
		frm.query.value = base64Encode(encodeURIComponent(frm.query.value));
		frm.action="<html:rewrite page="/sysSqlQueryExcel.act"/>";
		frm.submit();
	}
	
</script>
    
</head>
	
<body>
	<table border="0">
    <html:form action="/sysSqlQuery">
    <tr>
      <td align="center">
			<html:textarea rows="15" cols="150" name="sysAdmSqlQueryForm" property="query"/><br/>
			<input type="button" value="실행" onclick="querySubmit(this.form);">
			<input type="button" value="엑셀받기" onclick="queryexceldown(this.form);">
      <br><br></td>
	    <td>
    <br><br></tr>
		</html:form>
    </table><br>
    <bean:define id="lists" name="sysAdmSqlQueryForm" property="list" />
    <b><font color="red">쿼리타임 : <bean:write name="sysAdmSqlQueryForm" property="runtimesecond"/></font></b><br>
    <table border="0" cellpadding="3" cellspacing="1" bgcolor="CCCCCC">
   
    <%
      java.util.List rows = (java.util.List) lists;
      if (rows!=null) {
      
        for (int i=0; i<rows.size(); i++) {
           java.util.List cols = (java.util.List)rows.get(i);
          %>
            <tr bgcolor="F5F5F5" align="center">
              <td height="25"><%=i%></td> 
            <%
          for (int j=0; j<cols.size(); j++) {
            %>
              <td><%=cols.get(j)%></td>
            <%
          }
            %>
            </tr>
          <%
        }
      }
    %>
	</table>
	<iframe id="actionFrame" width="0" height="0"></iframe>
</body>
</html>
