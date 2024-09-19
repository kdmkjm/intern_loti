var xmlHttp = null;														// will store reference to the XMLHttpRequest object
// creates an XMLHttpRequest instance
function createXmlHttpRequestObject()  {
	var xmlHttp;														// will store the reference to the XMLHttpRequest object
	// this should work for all browsers except IE6 and older
	try {
		// try to create XMLHttpRequest object
		xmlHttp = new XMLHttpRequest();
	} catch(e) {
		// assume IE6 or older
		var XmlHttpVersions = new Array("MSXML2.XMLHTTP.6.0",
										"MSXML2.XMLHTTP.5.0",
										"MSXML2.XMLHTTP.4.0",
										"MSXML2.XMLHTTP.3.0",
										"MSXML2.XMLHTTP",
										"Microsoft.XMLHTTP");
		for (var i=0; i<XmlHttpVersions.length && !xmlHttp; i++) {  // try every prog id until one works
			try { 
				xmlHttp = new ActiveXObject(XmlHttpVersions[i]);	   // try to create XMLHttpRequest object
			} catch (e) {}
		}
	}

	if (!xmlHttp)														         // return the created object or display an error message
		alert("Error creating the XMLHttpRequest object.");
	else 
		return xmlHttp;
}

// initiates an AJAX request
function ajaxRequest(url, callback) {
	var innerCallback = callback;										      // stores a reference to the function to be called when the response // from the server is received 

	if (!xmlHttp) xmlHttp = createXmlHttpRequestObject();				// create XMLHttpRequest object when this method is first called

	if (xmlHttp && (xmlHttp.readyState == 4 || xmlHttp.readyState == 0)) {// if the connection is clear, initiate new server request
		xmlHttp.onreadystatechange = handleGettingResults;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}
	else
    	setTimeout("ajaxRequest(url,callback)", 1000);					// if the connection is busy, retry after 1 second
  
	// called when the state of the request changes 
	function handleGettingResults() {
		if (xmlHttp.readyState == 4) {									   // move forward only if the transaction has completed
			if (xmlHttp.status == 200) {								      // a HTTP status of 200 indicates the transaction completed 
				innerCallback(xmlHttp.responseText)						   // execute the callback function, passing the server response
         	xmlHttp = null;                                       // 사용하고 나면 반납해야지요. ^^
			} else	{													         // display error message
				alert("Couldn't connect to server");
			}
		}
	}
	
}
