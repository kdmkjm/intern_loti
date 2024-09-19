<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<%-- common include --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>

<script language="javascript" type="text/javascript">
    <logic:present name="option_cmidf">

        if (parent.span_cmidf) {
            parent.span_cmidf.innerHTML = '';
            var new_selectbox = '<select name="cmidf" class="form1">'
                              + '<option value="">과정선택</option>'
                              + '<option value="">- - - - -</option>'
                              + '<bean:write name="option_cmidf" filter="HTML"/>'
                              + '</select>';
            parent.span_cmidf.innerHTML = new_selectbox;
        }

    </logic:present>
    <logic:present name="option_sbnam">
    	if(parent.span_sbnam)
    	{
    		parent.span_sbnam.innerHTML = '';
    		var new_selectbox = '<select name="sbidf" id="sbidf" style="width:90%;" onchange="checkSbidf()">'
			        			+ '<option value="">선택</option>'
			        			+ '<option value="">----------------</option>'
			        			+ '<bean:write name="option_sbnam" filter="HTML"/>'
			        			+ '</select>';
			parent.span_sbnam.innerHTML = new_selectbox;
    	}
    </logic:present>
    <logic:present name="esseq">
    	parent.document.forms[0].esseq.value = '${esseq}';
    	parent.document.forms[0].cjsrl.value = '${cjsrl}';
    </logic:present>
</script>
