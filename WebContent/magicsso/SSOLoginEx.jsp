<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.dreamsecurity.web.agent.APIMainJni"%>
<%@ page import="com.dreamsecurity.web.agent.api.SSOApiAdmin"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dreamsecurity.web.agent.config.SSOConfig" %>
<%@ page import="com.dreamsecurity.web.agent.crypto.util.EncFunc" %>
<%@ page import="com.dreamsecurity.web.agent.crypto.util.HashEncFunc" %>
<%@ page import="com.dreamsecurity.framework.util.SubMessageLog" %>
<%@ page import="java.util.StringTokenizer" %>

<%
	NumberFormat nf = new DecimalFormat("000000");
	System.out.println(" ##### START ##### ");
    String process = request.getParameter("proc"); // S : 안전번호 확인 || null : 기존로그인
	String loginType = request.getParameter("loginType");
	String encryptedData = request.getParameter("ED");
	System.out.println("process :: "+process);
	System.out.println("encryptedData :: "+encryptedData);
	String tokens = null;
	String encryptedTokens = null;
	
	SSOApiAdmin mnApi = APIMainJni.getInstance().getAPIAdmin();
	
	// 안전번호 확인
	/****************************
	코드 정리
	000001 : 정상처리
	010005 : 안전번호오류
	010011 : 안전번호 오류로 계정잠김
	010012 : 등록되지 않는 안전번호/ 등록페이지로 안내
	080002 : 요청받은 data 손실
	080003 : 요청받은 data 손실
	080004 : 프로세스명 없음 (L : 로그인 || S : 안전번호체크)
	etc    : agent-mas 통신 에러
	
	*****************************/
	if("S".equals(process))
	{
		String reqData = "";
		String userId = "";
		String plainSNs = "";
		List params = new ArrayList();
		if ((encryptedData != null && !"".equals(encryptedData))) {
			int n_ret = mnApi.decryptSym(encryptedData);
			if (n_ret == 0)
				reqData = mnApi.getResult();
			/*
			int ix = 0;
			StringTokenizer st = new StringTokenizer(reqData,"");
			while(st.hasMoreElements()){
				String tmp = st.nextToken();
				switch(ix){
				case 0 : userId = tmp;
				         break;
				case 1 : plainSNs = tmp;
						 break;
				}
				
			}
			*/
			/*
			String[] reqDArr = reqData.split("|||||");
			if(reqDArr.length > 1){
				userId = reqDArr[0];
				plainSNs = reqDArr[1];
			}
			*/
			String idxS = reqData.substring(0,1);
			int idx = Integer.parseInt(idxS);
			reqData = reqData.substring(1);
			
			userId = reqData.substring(0,idx);
			plainSNs = reqData.substring(idx);
			
			
			System.out.println("reqData :: "+reqData);
			System.out.println("userId :: "+userId);
			System.out.println("plainSNs :: "+plainSNs);
			params.add(passProc(plainSNs));
			params.add(userId);
			String resultCode = "";
			int returnCode = mnApi.checkSn(params);
				//SubMessageLog.info("code :: " + resultCode);
				if (returnCode == 0) {
					resultCode = parseHeader(mnApi.getResult());
					//System.out.println("resultCode :: "+resultCode);
					//SubMessageLog.info("resultCode :: "+resultCode);
					returnCode = "".equals(resultCode)?80002:Integer.parseInt(resultCode);
					//if(returnCode == 1)
					//{
				    System.out.println("returnCode :: "+returnCode);
					out.println(nf.format(returnCode));
				}else
					// mnApi.checkSn 호출시 에러
					out.println(nf.format(returnCode));
		}else
			// encryptedData empty
			out.println(nf.format(80003));
			
	}
	// 로그인
	else
	{
		if (loginType == null)
		{
			loginType = "0";		// 기본값은 ID/PASS 로그인
		}
		
		int returnCode = mnApi.loginFromClient(loginType, encryptedData, request.getRemoteAddr());
		
		if (returnCode == 0 || returnCode == 100 || returnCode == 101)
		{
			tokens = mnApi.getToken();
			
			if ((returnCode = mnApi.encryptInnerKey(tokens)) == 0 )
			{
				encryptedTokens = mnApi.getResult();
				out.println(encryptedTokens);
			}
			else
			{
				out.println(nf.format(223));
		    }
		}
		else
		{
			out.println(nf.format(returnCode));
		}
	}
	
%>
<%!
public String passProc(String strPass) {
		String isExt = SSOConfig.getInstance().getString("password.isExtenal");
		if ("1".equals(isExt)) {
			Class cls = null;
			try {
				cls = Class.forName(SSOConfig.getInstance().getString("password.funcClass"));
				EncFunc de =  (EncFunc)cls.newInstance();
				strPass = de.encryptStr(strPass);
				de = null;
			} catch (ClassNotFoundException cnf) {
				return strPass;
			} catch (Exception e) {
				return strPass;
			}
		}
		return strPass;
}

public String parseHeader(String msg)
{
	if(msg.length()< 16) return "";
	String tmp = msg.substring(8,16);
	//System.out.println("tmp :: "+tmp);
	return tmp;
}
 %>