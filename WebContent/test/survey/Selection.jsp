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
    
    <logic:present name="option_coursecode">

        if (parent.span_cmidf) {
            parent.span_cmidf.innerHTML = '';
            var new_selectbox = '<select name="coursecode" class="form1">'
                              + '<option value="">과정선택</option>'
                              + '<option value="">- - - - -</option>'
                              + '<bean:write name="option_coursecode" filter="HTML"/>'
                              + '</select>';
            parent.span_cmidf.innerHTML = new_selectbox;
        }

    </logic:present>
</script>
