<%@ page contentType="text/html; charset=utf-8"
	import="com.dreamsecurity.web.agent.api.SSOApiAdmin"
	import="com.dreamsecurity.web.agent.APIMainJni"
	import="com.dreamsecurity.framework.util.EAMCrypt"
	import="com.dreamsecurity.web.agent.api.SSOUserPool"
	import="com.dreamsecurity.web.agent.api.SSOUserVO"
	import="com.dreamsecurity.web.agent.rpc.RpcUtil"
	import="com.dreamsecurity.web.agent.log.Logger"
    import="com.dreamsecurity.web.agent.log.LoggerFactory"
    import="java.util.List"
    import="java.util.ArrayList"
    import="com.dreamsecurity.web.agent.config.SSOConfig"
    import="com.dreamsecurity.web.agent.crypto.util.EncFunc"
    import="com.dreamsecurity.web.agent.crypto.util.DoroEncFunc"
    import="com.dreamsecurity.web.agent.crypto.util.HashEncFunc"
    import="java.util.StringTokenizer"
%>
<%@ page import="com.dreamsecurity.framework.util.SubMessageLog" %>
<%@ page import="com.dreamsecurity.framework.util.SubMessageHandler" %>

<%@ include file="./ssoCommon.jsp"%>
<%!
    
	private Logger log = LoggerFactory.getInstance().getLogger("");

	private void setUserInformation(SSOApiAdmin mnApi, HttpSession httpSession,HttpServletResponse httpResponse) {
		httpSession.setAttribute(S_LOGIN_ID, mnApi.getTokenValue(T_USER_ID));
		httpSession.setAttribute(S_LOGIN_NAME, mnApi.getName());
		httpSession.setAttribute(S_PW, mnApi.getTokenValue(T_PW));
		httpSession.setAttribute(S_COMP_CODE, mnApi.getTokenValue(T_COMP_CODE));
		
		httpSession.setAttribute(S_SN_VALIDATE, mnApi.getTokenValue(T_SN_VALIDATE));
		httpSession.setAttribute(S_PW_VALIDATE, mnApi.getTokenValue(T_PW_VALIDATE));
		httpSession.setAttribute(S_LASTLOGIN_CHECK, mnApi.getTokenValue(T_LASTLOGIN_CHECK));
		httpSession.setAttribute(S_ACLCODE_LIST, mnApi.getTokenValue(T_ACLCODE_LIST));
		
		
		Cookie cookie =new Cookie("ssoid",(String)httpSession.getAttribute(S_LOGIN_ID));
		//cookie.setMaxAge(36000);
		httpResponse.addCookie(cookie);
		//makeCookie((String)httpSession.getAttribute(S_LOGIN_ID));

	}

	private String tokenConvert(String userToken) {
		String sep = "APP_CODE=";
		String ent = "\n";
		int idxs = userToken.indexOf(sep);
		if (idxs > 0) {
			String tmpStr = userToken.substring(idxs+sep.length());
			int end = tmpStr.indexOf(ent);
			
			String tmpStr2 = tmpStr.substring(0,end);
			if(!"APPLDEFAULT".equals(tmpStr2)){
				userToken = userToken.replaceAll(tmpStr2, "[" + tmpStr2 + "]");
				userToken = userToken.replaceAll(sep,ent);
			}
		}
		System.out.println(" ##### secure.jsp - tokenConvert() :: userToken = "+userToken);
		return userToken;
	}
%>
<%
	out.clear();
	out.print("<?xml version='1.0' encoding='utf-8' ?>");
	response.setContentType("text/xml; charset=utf-8");
	
	String actionName = request.getParameter("actionName");
	boolean success = false;
	int code = -1;
	String message = "";
	String etc = "";
	
	SSOApiAdmin mnApi = null;

	try {
		mnApi = APIMainJni.getInstance().getAPIAdmin();

	} catch (Exception e) {
		e.printStackTrace();
	}

	if ("LOGIN_SESSION_CHECK".equals(actionName)) {
		if (session.getAttribute(S_LOGIN_NAME) != null) {
			//success = true;
			//code = 0;
			session.invalidate();
		} else {
			session.invalidate();
		}
	} else if ("GET_SERVER_CERTIFICATION".equals(actionName)) {
		if ((message = (String) application.getAttribute("_SERVER_CERTIFICATIONx")) != null) {
			success = true;
			code = 0;
		} else {
			try {
				if ((code = mnApi.getCert(CERT_CONFIG)) == 0) {
					message = new String(mnApi.getResult());
					application.setAttribute("_SERVER_CERTIFICATION", message);
					success = true;
					code = 0;
				} else {
					code = 70005;
				}
			} catch (Exception e) {
				code = 70005;
				message = e.getMessage();
				e.printStackTrace();
			}
		}
	} else if ("INIT_KEY".equals(actionName)) {
		String initialSessionKey = (String) request.getParameter("initialSessionKey");

		try {
			if ((code = mnApi.verifyKey(initialSessionKey, CERT_CONFIG)) == 0) {
				String tmpKey = mnApi.getResult();
				System.out.println("tmpKey :: "+tmpKey);
				if ((code = mnApi.changeKey(tmpKey)) == 0) {
					session.setAttribute("secretKey", mnApi.getClientSessionKey());
					session.setAttribute("timeStamp", mnApi.getTimeStampNo());

					success = true;
					code = 0;
					message = mnApi.getResult();
				} else
					code = 70007;
			} else
				code = 70006;
		} catch (Exception e) {
		}
	} else if ("CONNECT".equals(actionName)) {
		String ssoEncryptedData = request.getParameter("ssoEncryptedData");
		String secretKey = (String) session.getAttribute("secretKey");
		String timeStamp = (String) session.getAttribute("timeStamp");
		boolean isMultiDomain = new Boolean(request.getParameter("isMultiDomain")).booleanValue();
		session.removeAttribute("timeStamp");

		if (ssoEncryptedData != null && !"".equals(ssoEncryptedData)) {
			if (secretKey != null && !"".equals(secretKey)) {
				if (timeStamp != null && !"".equals(timeStamp)) {
					if ((code = mnApi.decryptKeyEx(secretKey,ssoEncryptedData, timeStamp)) == 0) {
						String userToken = mnApi.getResult();
						mnApi.setToken(tokenConvert(userToken));
						if (userToken != null && !"".equals(userToken)) {
							if (isMultiDomain) {session.setAttribute("IDENTITY_KEY",mnApi.getID());
							} else {
									setUserInformation(mnApi, request.getSession(), response);
									success = true;
									code = 0;
							}
						} else
							code = 70009;
					}
				} else
					code = 70010;
			} else
				code = 70011;
		} else
			code = 70008;
	} else if ("LOGIN".equals(actionName)) {
		String macAddr = "";
		String encMacAddr = "";
		String ssoEncryptedData = request.getParameter("ssoEncryptedData");
		String ssoLoginType = request.getParameter("ssoLoginType");
		String applicationCode = request.getParameter("ssoApplicationCode");
		boolean isEam = new Boolean(request.getParameter("isEam")).booleanValue();
		boolean isMultiDomain = new Boolean(request.getParameter("isMultiDomain")).booleanValue();
		String secretKey = (String) session.getAttribute("secretKey");
		String timeStamp = (String) session.getAttribute("timeStamp");
		String identityKey = (String) session.getAttribute("IDENTITY_KEY");
		
		System.out.println("@@@ sessionId : "+request.getSession().getId());
		System.out.println("@@@ ssoEncryptedData : "+ssoEncryptedData);
		System.out.println("@@@ ssoLoginType : "+ssoLoginType);
		System.out.println("@@@ applicationCode : "+applicationCode);
		
		System.out.println("@@@ secretKey : "+secretKey);
		System.out.println("@@@ timeStamp : "+timeStamp);
		System.out.println("@@@ identityKey : "+identityKey);
		
		identityKey = (identityKey == null || "".equals(identityKey))?(String)session.getAttribute(S_LOGIN_ID):identityKey;
		String compCode = (session.getAttribute(S_COMP_CODE)==null )? _DEF_SITECODE : (String)session.getAttribute(S_COMP_CODE);
		
		encMacAddr = request.getParameter("macAddr");
		
		if(0==mnApi.decryptSym(encMacAddr))
		macAddr =mnApi.getResult();
		
		System.out.println("macAddr s= "+macAddr);
		
		session.removeAttribute("timeStamp");
		session.removeAttribute("IDENTITY_KEY");
		
		System.out.println("ssoEncryptedData =============================== " + ssoEncryptedData);
		if ((ssoEncryptedData != null && !"".equals(ssoEncryptedData))|| isMultiDomain) {
			if (secretKey != null && !"".equals(secretKey)) {
				mnApi.setClientKey(secretKey);

				if (timeStamp != null && !"".equals(timeStamp)) {
					if (isMultiDomain)
						code = mnApi.loginByOnlyId(compCode,identityKey, request.getRemoteAddr());
					else {
						if ("0".equals(ssoLoginType) || "7".equals(ssoLoginType))
							//code = mnApi.logOn(ssoEncryptedData, macAddr, timeStamp);
							code = mnApi.logOn(ssoEncryptedData,timeStamp);
						else if ("3".equals(ssoLoginType)){
							if(macAddr != null && !"".equals(macAddr))
								code = mnApi.logOnEx(ssoEncryptedData, timeStamp, request.getRemoteAddr(), macAddr);	
							else
								code = mnApi.logOnEx(ssoEncryptedData, timeStamp, request.getRemoteAddr());
						}
					}

					if (code == 0 || code == 100) {
						String userToken = mnApi.getToken();

						if (userToken != null && !"".equals(userToken)) {
							request.getSession().setAttribute(S_TOKEN,userToken);
							// 최초로그인
							if("N".equals(mnApi.getTokenValue(T_INIT_STATUS))){
								success = false;
								code = 70013; // 최초로그인 비밀번호 변경 필요
								session.setAttribute(S_TMP_USERID, mnApi.getID());
							}
							else if("N".equals(mnApi.getTokenValue(T_LASTLOGIN_CHECK))){
								success = false;
								code = 70014; // 로그인 유효기간초과
								session.setAttribute(S_TMP_USERID, mnApi.getID());
							}
							else if("N".equals(mnApi.getTokenValue(T_PW_VALIDATE))){
								success = false;
								code = 70015; // 패스워드변경기간 초과
								session.setAttribute(S_TMP_USERID, mnApi.getID());
							}
							
							else{
								if ((code = mnApi.encryptKey(secretKey,userToken)) == 0) {
									success = true;
									String tmpPV  = mnApi.getTokenValue(T_PW_VALIDATE);
									String tmpSV  = mnApi.getTokenValue(T_SN_VALIDATE);
									
									String flagPV = (tmpPV != null && !"".equals(tmpPV))?tmpPV.substring(0,1):"";
									String flagSV = (tmpSV != null && !"".equals(tmpSV))?tmpSV.substring(0,1):"";
									
									String lDate = (tmpPV != null && !"".equals(tmpPV))?tmpPV.substring(1):"";
									String sDate = (tmpSV != null && !"".equals(tmpSV))?tmpSV.substring(1):"";
									
									System.out.println("flagPV :: "+flagPV);
									System.out.println("flagSV :: "+flagSV);
									
									code = ("W".equals(flagSV))? 70017: 0 ;
									code = ("W".equals(flagPV))? 70016: code ;
									
									message = mnApi.getResult();
									etc = (code == 70017)?sDate:lDate;
									setUserInformation(mnApi, request.getSession(), response);
									//System.out.println("test : "+ tokenParse(userToken,"APPL_NAME="));
								}
							}
						} else
							code = 70009;
					}
				} else
					code = 70010;
			} else
				code = 70011;
		} else
			code = 70008;
	} else if ("PW_INSERT".equals(actionName)) {
		String encryptedPW = request.getParameter("encryptedPW");
		String plainPWs = "";
		List params = new ArrayList();
		if ((encryptedPW != null && !"".equals(encryptedPW))) {
			int n_ret = mnApi.decryptSym(encryptedPW);
			if (n_ret == 0)
				plainPWs = mnApi.getResult();
			String[] tmp = plainPWs.split(_SEP);
			if(tmp.length>=2){
				String id = tmp[0];
				
				/** DEFAULT */
				//String pw = passProc(tmp[1]);
				
				/** 흥국 IM 연동시 sn plain 값으로 전송*/
				String pw = tmp[1];
				
				int resultCode = -1;
				if (id != null) {
					params.add(pw); 
					params.add(id);
					code = mnApi.addPw(params);
					System.out.println(" code 111 :::: "+code);
					if (code == 0) {
						resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
					}
					code = resultCode;
					if(code == 1){
						code = 0;
						success = true;
						message = "SUCCESS";
					}
					System.out.println("code 222 :::: "+code);
				} else 
					code = 80001;
			}else 
				code = 80002;
		} else
			code = 70008;	
	} else if ("PW_CHANGE".equals(actionName)) {
		String encryptedPW = request.getParameter("encryptedPW");
		String plainPWs = "";
		List params = new ArrayList();
		Object idObj = (session.getAttribute(S_LOGIN_ID)==null)?session.getAttribute(S_TMP_USERID):session.getAttribute(S_LOGIN_ID);
		if ((encryptedPW != null && !"".equals(encryptedPW))) {
			int n_ret = mnApi.decryptSym(encryptedPW);
			if (n_ret == 0)
				plainPWs = mnApi.getResult();
			/** CASE : 1 일괄처리시 (DEFAULT)*/
			/*
			StringTokenizer st = new StringTokenizer(plainPWs, _SEP);
			while (st.hasMoreElements()) {
				params.add(passProc((String) st.nextElement()));
			}
			*/
			/** CASE 1 : END */
			
			/** CASE 2 : im 연동처리 인증받을 기존pw는 encrypt시키고 등록할 pw는 plain하게 전송(NETS에 plain text로 전송)*/
			String[] tmp = plainPWs.split(_SEP);
			
			//String bpw = passProc(tmp[0]);
			String bpw = EncFunc.getInstance().encryptStr(tmp[0]);
			
			//String apw = tmp[1];
			//String apw = passProc(tmp[1]);
			String apw = EncFunc.getInstance().encryptStr(tmp[1]);
			
			System.out.println("bpw :: "+tmp[0]);
			System.out.println("apw :: "+tmp[1]);
			System.out.println("enc apw :: "+apw);
			params.add(bpw);
			params.add(apw); 
			/** CASE 2 END */
			
			int resultCode = -1;
			if (idObj != null) {
				params.add((String) idObj); // ID 세팅
				code = mnApi.changePw(params);
				log.debug(" PW_CHANGE == > result code :: " + code);
				if (code == 0) {
					resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
				}
				//code = "".equals(resultCode)?80002:Integer.parseInt(resultCode);
				code = (-1 == resultCode)? 80002: resultCode;
				if(code == 1){
					code = 0;
					success = true;
					message = "SUCCESS";
				}
				//System.out.println("code :::: "+code);
			} else {
				code = 80001;
			}
		} else
			code = 70008;
	} else if ("SN_INSERT".equals(actionName)) {
		String encryptedPW = request.getParameter("encryptedPW");
		String plainPWs = "";
		List params = new ArrayList();
		if ((encryptedPW != null && !"".equals(encryptedPW))) {
			int n_ret = mnApi.decryptSym(encryptedPW);
			if (n_ret == 0)
				plainPWs = mnApi.getResult();
			String[] tmp = plainPWs.split(_SEP);
			if(tmp.length>=2){
				String id = tmp[0];
				
				//String pw = passProc(tmp[1]);
				/** 흥국 IM 연동시 sn plain 값으로 전송*/
				String pw = tmp[1];
				
				int resultCode = -1;
				if (id != null) {
					params.add(pw); 
					params.add(id);
					code = mnApi.addSn(params);
					if (code == 0) {
						resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
					}
					//code = "".equals(resultCode)? 80002 : Integer.parseInt(resultCode);
					code = (-1 == resultCode)? 80002: resultCode;
					if(code == 1){
						code = 0;
						success = true;
						message = "SUCCESS";
					}
					//System.out.println("code :::: "+code);
				} else 
					code = 80001;
			}else 
				code = 80002;
		} else
			code = 70008;	
	} else if ("SN_CHANGE".equals(actionName)) {
		String encryptedSN = request.getParameter("encryptedSN");
		String plainSNs = "";
		List params = new ArrayList();
		Object idObj = (session.getAttribute(S_LOGIN_ID)==null)?session.getAttribute(S_TMP_USERID):session.getAttribute(S_LOGIN_ID);
		if ((encryptedSN != null && !"".equals(encryptedSN))) {
			int n_ret = mnApi.decryptSym(encryptedSN);
			if (n_ret == 0)
				plainSNs = mnApi.getResult();
			
			/** CASE : 1 일괄처리시 (DEFAULT)*/
			/*
			StringTokenizer st = new StringTokenizer(plainSNs, _SEP);
			while (st.hasMoreElements()) {
				params.add(passProc((String) st.nextElement()));
			}
			*/
			/** CASE 1 : END */
			
			
			/** CASE 2 : im 연동처리 인증받을 기존 sn은  encrypt시키고 등록할 sn는 plain하게 전송*/
			String[] tmp = plainSNs.split(_SEP);
			//String bsn = passProc(tmp[0]);
			String bsn = EncFunc.getInstance().encryptStr(tmp[0]);
			String asn = tmp[1];
			
			params.add(bsn);
			params.add(asn);
			/** CASE 2 END */
			
			int resultCode = -1;
			if (idObj != null) {
				params.add((String) idObj);
				
				code = mnApi.changeSn(params);
				System.out.println("code :: " + code);
				if (code == 0) {
					resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
				}
				code = (-1 == resultCode)? 80002: resultCode;
				if(code == 1){
					code = 0;
					success = true;
					message = "SUCCESS";
				}
			} else {
				code = 80001;
			}
		} else
			code = 70008;
	} else if ("SN_CHECK".equals(actionName)) {
		String encryptedSN = request.getParameter("encryptedSN");
		String plainSNs = "";
		List params = new ArrayList();
		Object idObj = (session.getAttribute(S_LOGIN_ID)==null)?session.getAttribute(S_TMP_USERID):session.getAttribute(S_LOGIN_ID);
		if ((encryptedSN != null && !"".equals(encryptedSN))) {
			int n_ret = mnApi.decryptSym(encryptedSN);
			if (n_ret == 0)
				plainSNs = mnApi.getResult();
			//params.add(passProc(plainSNs));
			params.add(EncFunc.getInstance().encryptStr(plainSNs));
			int resultCode = -1;
			if (idObj != null) 
			{
				params.add((String) idObj);
				code = mnApi.checkSn(params);
				System.out.println("code :: " + code);
				if (code == 0) {
					resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
					System.out.println("resultCode :: "+resultCode);
				}
				//code = "".equals(resultCode)?80002:Integer.parseInt(resultCode);
				code = (-1 == resultCode)? 80002: resultCode;
				if(code == 1)
				{
					code = 0;
					success = true;
					message = "확인완료.";
				}
			
			} else {
				code = 80001;
			}
		} else
			code = 70008;
	} else if ("SET_DN".equals(actionName)) {
		String encryptedDN = request.getParameter("encryptedDN");
		//String encryptedDN = new String(request.getParameter("encryptedDN").getBytes("utf-8"),"euc-kr");
		String plainDNs = "";
		List params = new ArrayList();
		Object idObj = (session.getAttribute(S_LOGIN_ID)==null)?session.getAttribute(S_TMP_USERID):session.getAttribute(S_LOGIN_ID);
		if ((encryptedDN != null && !"".equals(encryptedDN))) {
			int n_ret = mnApi.decryptSymBase64(encryptedDN);
			if (n_ret == 0)
				plainDNs = mnApi.getResult();
			System.out.println("plainDNs : "+plainDNs);
			String subMsg = System.getProperty("file.encoding")+" ##### code : "+n_ret+" || plainDNs : "+plainDNs;
			//SubMessageLog.info(subMsg);
			
			params.add(plainDNs);
			int resultCode = -1;
			if (idObj != null) {
				params.add((String) idObj);
				code = mnApi.setDn(params);
				System.out.println("code :: " + code);
				if (code == 0) {
					resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
				}
				code = (-1 == resultCode)? 80002: resultCode;
				if(code == 1){
					code = 0;
					success = true;
					message = "SUCCESS";
				}
			} else {
				code = 80001;
			}
		} else
			code = 70008;
	} else if ("MAKE_HASH".equals(actionName)) {
		String encryptedRESC = request.getParameter("encryptedRESC");
		String plainRESC = "";
		if ((encryptedRESC != null && !"".equals(encryptedRESC))) {
			int n_ret = mnApi.decryptSym(encryptedRESC);
			if (n_ret == 0)
				plainRESC = mnApi.getResult();
			HashEncFunc he = new HashEncFunc();
			String tmpEnc = he.encryptStr(plainRESC);
			code=0;
			success = true;
			message = tmpEnc;
			he = null;
		}else
			code=70008;
	} else if ("CIPHER".equals(actionName)) {
		if ((code = mnApi.encryptURL(request.getParameter("source"))) == 0) {
			out.clear();

			response.setContentType("text/html");
			out.println(mnApi.getResult());
		}
		return;
	// 기존 로그아웃 ( Logout.js 를 통해서 들어오는 요청 처리)
	}else if("LOGOUT".equals(actionName)){	
		int resultCode = -1;
		String userid = request.getParameter("ssoid");
		code = mnApi.logout(userid);
		if (code == 0) {
			resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
		}
		System.out.println("resultCode :::: "+resultCode);
		code = (-1 == resultCode)? 80002: resultCode;
		
		if(code == 1){
			code = 0;
			success = true;
			message = "SUCCESS";
		}else if(code==-1){ 
			code = 39003;
		}else{ 
			code = 39002;
		}
	// 신규 로그아웃 처리(매직패스에서 다이렉트로 들어오는 로그아웃처리)	
	}else if("LOGOUTC".equals(actionName)){	
		System.out.println(" ##### MagicPass Direct Logtout START  ##### ");
		System.out.println(" ##### sessionId :: "+request.getSession().getId());
		//System.out.println(" LOGOUT START ~~~");
		//System.out.println("query : "+request.getQueryString());
		int resultCode = -1;
		String userid = request.getParameter("ssoid");
		//System.out.println(" Encrypted userid : "+userid);
		userid = userid.replaceAll(" ","+");
		//System.out.println(" Encrypted userid : "+userid);
		//System.out.println(" Encrypted userid : "+userid.length());
		int n_ret = mnApi.decryptSym(userid);
		if(n_ret == 0)
			userid = mnApi.getResult();
		//System.out.println(" Decrypted userid 11 : "+userid);
		//System.out.println(" n_ret : "+n_ret);
		int sidx = userid.indexOf(_SEP);
		if(sidx > -1)
			userid = userid.substring(0,sidx);
		//System.out.println(" Decrypted userid : "+userid);
		code = mnApi.logout(userid);
		if (code == 0) {
			resultCode = RpcUtil.parseHeaderStatus(mnApi.getResult());
		}
		//System.out.println("resultCode :::: "+resultCode);
		code = (-1 == resultCode)? 80002: resultCode;
		
		if(code == 1){
			code = 0;
			success = true;
			message = "SUCCESS";
		}else if(code==-1){ 
			code = 39003;
		}else{ 
			code = 39002;
		}
		
	}
%>
<%!
	public String tokenParse(String token, String skey) {
		String key = skey;
		String ent = "\n";
		int idx = token.indexOf(key);
		String strTmp = "";
		if (idx > -1) {
			strTmp = token.substring(idx + key.length());
			int endp = strTmp.indexOf(ent);
			if (endp > -1) {
				strTmp = strTmp.substring(0, endp);
				return strTmp;
			} else {
				return "";
			}
		}
		return strTmp;
	}
	
	public boolean aclCheck(String aclList){
		System.out.println(" ##### aclcode :: "+aclList);
		
		if(aclList == null) return false;
		boolean aclCK = false;
		StringTokenizer stk =  new StringTokenizer(aclList,"||");
		while(stk.hasMoreElements()){
			String srcCode = stk.nextToken();
			if(_ACLCODE.equals(srcCode))
				aclCK = true;
		}
		return aclCK;
	}
%>

<MagicSSO>
	<actionName><%=actionName%></actionName>
	<success><%=success%></success>
	<code><%=code%></code>
	<etc><%=etc%></etc>
	<message><![CDATA[<%=message%>]]></message>
</MagicSSO>
