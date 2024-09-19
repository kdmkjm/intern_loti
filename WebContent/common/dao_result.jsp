<?xml version="1.0" encoding="euc-kr"?>
<%
response.setContentType("application/xml");
%>
<ajax-response>
    <response
            success="${result}"
            msg="${msg}"
            chkDate="${chkDate}"
    />
</ajax-response>