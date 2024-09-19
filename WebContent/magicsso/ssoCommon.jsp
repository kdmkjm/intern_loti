<%!
	
	final String _DEF_SITECODE  = "HKAP";	      //used reLogin process 
	final String _ACLCODE       = "SYGG001";      // ACLCODE of CURRENT SYSTEM 
	
	final String _MAGICSSO_DOCBASE  = "/magicsso";      // ACLCODE of CURRENT SYSTEM 
	final String _MAGICLINE_DOCBASE = "/magicline";      // ACLCODE of CURRENT SYSTEM 

    // session parameter name
    final String CERT_CONFIG 			= "__UNUSED__";
	final String S_LOGIN_ID 			= "SSO_ID";
	final String S_LOGIN_NAME 			= "SSO_NAME";
	final String S_USER_TYPE 			= "SSO_USER_TYPE";
	final String S_USER_GUBUN 			= "SSO_USER_GUBUN";
	final String S_PADMN_GUBUN 			= "SSO_PADMN_GUBUN";
	final String S_EMP_NO 				= "SSO_EMP_NO";
	final String S_OFFICE_NO 			= "SSO_OFFICE_NO";
	final String S_PW 					= "SSO_PW";
	final String S_SSN 					= "SSO_SSN";
	final String S_COMP_CODE 			= "SSO_COMP_CODE";
	final String S_CERT_YN 				= "SSO_CERT_YN";
	final String S_INIT_STATUS 			= "SSO_INIT_STATUS";
	final String S_TOKEN 				= "SSO_TOKEN";
	final String S_SN_VALIDATE 			= "SSO_SN_VALID";
	final String S_PW_VALIDATE 			= "SSO_PW_VALID";
	final String S_LASTLOGIN_CHECK 		= "SSO_LLOGIN_CHECK";
	final String S_ACLCODE_LIST 		= "SSO_ACLLIST";
	
	final String S_USER_INFO  		 	= "USER_INFO";   
	final String S_TMP_USERID 			= "TMP_USERID";       
	
	// Token parameter name
	final String T_USER_ID				= "ID";
	final String T_USER_TYPE			= "USER_TYPE";
	final String T_USER_GUBUN			= "USER_GUBUN";
	final String T_PADMN_GUBUN 			= "PADMN_GUBUN";
	final String T_OFFICE_NO 			= "OFFICE_NO";
	final String T_EMP_NO 				= "EMP_NO";
	final String T_PW 					= "PW";
	final String T_SSN 					= "SSN";
	final String T_COMP_CODE 			= "COMP_CODE";
	final String T_INIT_STATUS 			= "INIT_STATUS";
	final String T_SN_VALIDATE 			= "SN_VALIDATE_CHECK";
	final String T_PW_VALIDATE 			= "PW_VALIDATE_CHECK";
	final String T_LASTLOGIN_CHECK 		= "LASTLOGIN_CHECK";
	final String T_ACLCODE_LIST 		= "ACLCODE_LIST";
	
	// ETC
	final String _SEP 					= "!@#"; 
	
%>