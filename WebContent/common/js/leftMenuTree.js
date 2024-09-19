
	var contextPath = '/loti';

	// Node object
	function Node(id, pid, name, check, type, menuNo ,url, title, target, icon, iconOpen, open) {
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.check = check;
		this.menuNo = menuNo;
		this.type = type;
		this.url = url;
		this.title = title;
		this.target = target;
		this.icon = icon;
		this.iconOpen = iconOpen;
		this._io = open || false;
		this._is = false;
		this._ls = false;
		this._hc = false;
		this._ai = 0;
		this._p;
	};

	// Tree object
	function dTree(objName) {
		this.config = {
			target					: null,
			folderLinks			: true,
			useSelection		: true,
			useCookies			: true,
			useLines				: true,
			useIcons				: true,
			useStatusText		: false,
			closeSameLevel	: false,
			inOrder					: false
		}
		this.icon = {
			root				: contextPath + '/images/tree/base.gif',
			folder			: contextPath +'/images/tree/folder.gif',
			folderOpen	: contextPath +'/images/tree/folderopen.gif',
			node				: contextPath +'/images/tree/page.gif',
			empty				: contextPath +'/images/tree/empty.gif',
			line				:contextPath + '/images/tree/line.gif',
			join				:contextPath + '/images/tree/join.gif',
			joinBottom	:contextPath + '/images/tree/joinbottom.gif',
			plus				: contextPath +'/images/tree/plus.gif',
			plusBottom	: contextPath +'/images/tree/plusbottom.gif',
			minus				: contextPath +'/images/tree/minus.gif',
			minusBottom	:contextPath + '/images/tree/minusbottom.gif',
			nlPlus			: contextPath +'/images/tree/nolines_plus.gif',
			nlMinus			: contextPath +'/images/tree/nolines_minus.gif'
		};
		this.obj = objName;
		this.aNodes = [];
		this.aIndent = [];
		this.root = new Node(-1);
		this.selectedNode = null;
		this.selectedFound = false;
		this.completed = false;
	};

	// Adds a new node to the node array
	dTree.prototype.add = function(id, pid, name, check, type, menuNo,url , title, target, icon, iconOpen, open) {
		this.aNodes[this.aNodes.length] = new Node(id, pid, name, check, type, menuNo, url, title, target, icon, iconOpen, open);
	};

	// Open/close all nodes
	dTree.prototype.openAll = function() {
		this.oAll(true);
	};
	dTree.prototype.closeAll = function() {
		this.oAll(false);
	};

	// Outputs the tree to the page
	dTree.prototype.toString = function() {
		var str = '<div class="dtree">\n';
		if (document.getElementById) {
			if (this.config.useCookies) this.selectedNode = this.getSelected();
			str += this.addNode(this.root);
		} else str += 'Browser not supported.';
		str += '</div>';
		if (!this.selectedFound) this.selectedNode = null;
		this.completed = true;
		return str;
	};

	// Creates the tree structure
	dTree.prototype.addNode = function(pNode) {
		var str = '';
		var n=0;
		if (this.config.inOrder) n = pNode._ai;
		for (n; n<this.aNodes.length; n++) {
			if (this.aNodes[n].pid == pNode.id) {
				var cn = this.aNodes[n];
				cn._p = pNode;
				cn._ai = n;
				this.setCS(cn);
				if (!cn.target && this.config.target) cn.target = this.config.target;
				if (cn._hc && !cn._io && this.config.useCookies) cn._io = this.isOpen(cn.id);
				if (!this.config.folderLinks && cn._hc) cn.url = null;
				if (this.config.useSelection && cn.id == this.selectedNode && !this.selectedFound) {
						cn._is = true;
						this.selectedNode = n;
						this.selectedFound = true;
				}
				str += this.node(cn, n);
				if (cn._ls) break;
			}
		}
		return str;
	};

	// Creates the node icon, url and text
	dTree.prototype.node = function(node, nodeId) {
		var str = '<div class="dTreeNode">' + this.indent(node, nodeId);
		if (this.config.useIcons) {
			if (!node.icon) node.icon = (this.root.id == node.pid) ? this.icon.root : ((node._hc) ? this.icon.folder : this.icon.node);
			if (!node.iconOpen) node.iconOpen = (node._hc) ? this.icon.folderOpen : this.icon.node;
			if (this.root.id == node.pid) {
				node.icon = this.icon.root;
				node.iconOpen = this.icon.root;
			}

			//체크박스
			if(node.type=='M')
			{
				str += '<input type="checkbox"" name="select" id="i' + this.obj + nodeId + '"/>';
				str += '<input type="hidden" id="isCheck" name="isCheck" value="'+node.check+'"/>';
				str += '<input type="hidden" id="insMenuNo" name="insMenuNo" value="'+node.menuNo+'"/>';
			}
			else{
			//이미지
				str += '<img id="i' + this.obj + nodeId + '" src="' + ((node._io) ? node.iconOpen : node.icon) + '" alt="" />';
			}
		}
		if (node.url) {
			str += '<a id="s' + this.obj + nodeId + '" class="' + ((this.config.useSelection) ? ((node._is ? 'nodeSel' : 'node')) : 'node') + '" href="' + node.url + '"';
			if (node.title) str += ' title="' + node.title + '"';
			if (node.target) str += ' target="' + node.target + '"';
			if (this.config.useStatusText) str += ' onmouseover="window.status=\'' + node.name + '\';return true;" onmouseout="window.status=\'\';return true;" ';
			if (this.config.useSelection && ((node._hc && this.config.folderLinks) || !node._hc))
				str += ' onclick="javascript: ' + this.obj + '.s(' + nodeId + ');"';
			str += '>';
		}
		else if ((!this.config.folderLinks || !node.url) && node._hc && node.pid != this.root.id)
			str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');" class="node">';
		str += node.name;
		if (node.url || ((!this.config.folderLinks || !node.url) && node._hc)) str += '</a>';
		str += '</div>';
		if (node._hc) {
			str += '<div id="d' + this.obj + nodeId + '" class="clip" style="display:' + ((this.root.id == node.pid || node._io) ? 'block' : 'none') + ';">';
			str += this.addNode(node);
			str += '</div>';
		}
		this.aIndent.pop();
		return str;
	};

	// Adds the empty and line icons
	dTree.prototype.indent = function(node, nodeId) {
		var str = '';
		if (this.root.id != node.pid) {
			for (var n=0; n<this.aIndent.length; n++)
				str += '<img src="' + ( (this.aIndent[n] == 1 && this.config.useLines) ? this.icon.line : this.icon.empty ) + '" alt="" />';
			(node._ls) ? this.aIndent.push(0) : this.aIndent.push(1);
			if (node._hc) {
				str += '<a href="javascript: ' + this.obj + '.o(' + nodeId + ');"><img id="j' + this.obj + nodeId + '" src="';
				if (!this.config.useLines) str += (node._io) ? this.icon.nlMinus : this.icon.nlPlus;
				else str += ( (node._io) ? ((node._ls && this.config.useLines) ? this.icon.minusBottom : this.icon.minus) : ((node._ls && this.config.useLines) ? this.icon.plusBottom : this.icon.plus ) );
				str += '" alt="" /></a>';
			} else str += '<img src="' + ( (this.config.useLines) ? ((node._ls) ? this.icon.joinBottom : this.icon.join ) : this.icon.empty) + '" alt="" />';
		}
		return str;
	};

	// Checks if a node has any children and if it is the last sibling
	dTree.prototype.setCS = function(node) {
		var lastId;
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n].pid == node.id) node._hc = true;
			if (this.aNodes[n].pid == node.pid) lastId = this.aNodes[n].id;
		}
		if (lastId==node.id) node._ls = true;
	};

	// Returns the selected node
	dTree.prototype.getSelected = function() {
		var sn = this.getCookie('cs' + this.obj);
		return (sn) ? sn : null;
	};

	// Highlights the selected node
	dTree.prototype.s = function(id) {
		if (!this.config.useSelection) return;
		var cn = this.aNodes[id];
		if (cn._hc && !this.config.folderLinks) return;
		if (this.selectedNode != id) {
			if (this.selectedNode || this.selectedNode==0) {
				try {
					eOld = document.getElementById("s" + this.obj + this.selectedNode);
					eOld.className = "node";
				}catch (e){
				}
			}
			eNew = document.getElementById("s" + this.obj + id);
			eNew.className = "nodeSel";
			this.selectedNode = id;
			if (this.config.useCookies) this.setCookie('cs' + this.obj, cn.id);
		}
	};

	// Toggle Open or close
	dTree.prototype.o = function(id) {
		var cn = this.aNodes[id];
		this.nodeStatus(!cn._io, id, cn._ls);
		cn._io = !cn._io;
		if (this.config.closeSameLevel) this.closeLevel(cn);
		if (this.config.useCookies) this.updateCookie();
	};

	// Open or close all nodes
	dTree.prototype.oAll = function(status) {
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n]._hc && this.aNodes[n].pid != this.root.id) {
				this.nodeStatus(status, n, this.aNodes[n]._ls)
				this.aNodes[n]._io = status;
			}
		}
		if (this.config.useCookies) this.updateCookie();
	};

	// Opens the tree to a specific node
	dTree.prototype.openTo = function(nId, bSelect, bFirst) {
		if (!bFirst) {
			for (var n=0; n<this.aNodes.length; n++) {
				if (this.aNodes[n].id == nId) {
					nId=n;
					break;
				}
			}
		}
		var cn=this.aNodes[nId];
		if (cn.pid==this.root.id || !cn._p) return;
		cn._io = true;
		cn._is = bSelect;
		if (this.completed && cn._hc) this.nodeStatus(true, cn._ai, cn._ls);
		if (this.completed && bSelect) this.s(cn._ai);
		else if (bSelect) this._sn=cn._ai;
		this.openTo(cn._p._ai, false, true);
	};

	// Closes all nodes on the same level as certain node
	dTree.prototype.closeLevel = function(node) {
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n].pid == node.pid && this.aNodes[n].id != node.id && this.aNodes[n]._hc) {
				this.nodeStatus(false, n, this.aNodes[n]._ls);
				this.aNodes[n]._io = false;
				this.closeAllChildren(this.aNodes[n]);
			}
		}
	}

	// Closes all children of a node
	dTree.prototype.closeAllChildren = function(node) {
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n].pid == node.id && this.aNodes[n]._hc) {
				if (this.aNodes[n]._io) this.nodeStatus(false, n, this.aNodes[n]._ls);
				this.aNodes[n]._io = false;
				this.closeAllChildren(this.aNodes[n]);
			}
		}
	}

	// Change the status of a node(open or closed)
	dTree.prototype.nodeStatus = function(status, id, bottom) {
		eDiv	= document.getElementById('d' + this.obj + id);
		eJoin	= document.getElementById('j' + this.obj + id);
		if (this.config.useIcons) {
			eIcon	= document.getElementById('i' + this.obj + id);
			eIcon.src = (status) ? this.aNodes[id].iconOpen : this.aNodes[id].icon;
		}
		eJoin.src = (this.config.useLines)?
		((status)?((bottom)?this.icon.minusBottom:this.icon.minus):((bottom)?this.icon.plusBottom:this.icon.plus)):
		((status)?this.icon.nlMinus:this.icon.nlPlus);
		eDiv.style.display = (status) ? 'block': 'none';
	};


	// [Cookie] Clears a cookie
	dTree.prototype.clearCookie = function() {
		var now = new Date();
		var yesterday = new Date(now.getTime() - 1000 * 60 * 60 * 24);
		this.setCookie('co'+this.obj, 'cookieValue', yesterday);
		this.setCookie('cs'+this.obj, 'cookieValue', yesterday);
	};

	// [Cookie] Sets value in a cookie
	dTree.prototype.setCookie = function(cookieName, cookieValue, expires, path, domain, secure) {
		document.cookie =
			escape(cookieName) + '=' + escape(cookieValue)
			+ (expires ? '; expires=' + expires.toGMTString() : '')
			+ (path ? '; path=' + path : '')
			+ (domain ? '; domain=' + domain : '')
			+ (secure ? '; secure' : '');
	};

	// [Cookie] Gets a value from a cookie
	dTree.prototype.getCookie = function(cookieName) {
		var cookieValue = '';
		var posName = document.cookie.indexOf(escape(cookieName) + '=');
		if (posName != -1) {
			var posValue = posName + (escape(cookieName) + '=').length;
			var endPos = document.cookie.indexOf(';', posValue);
			if (endPos != -1) cookieValue = unescape(document.cookie.substring(posValue, endPos));
			else cookieValue = unescape(document.cookie.substring(posValue));
		}
		return (cookieValue);
	};

	// [Cookie] Returns ids of open nodes as a string
	dTree.prototype.updateCookie = function() {
		var str = '';
		for (var n=0; n<this.aNodes.length; n++) {
			if (this.aNodes[n]._io && this.aNodes[n].pid != this.root.id) {
				if (str) str += '.';
				str += this.aNodes[n].id;
			}
		}
		this.setCookie('co' + this.obj, str);
	};

	// [Cookie] Checks if a node id is in a cookie
	dTree.prototype.isOpen = function(id) {
		var aOpen = this.getCookie('co' + this.obj).split('.');
		for (var n=0; n<aOpen.length; n++)
			if (aOpen[n] == id) return true;
		return false;
	};

	// If Push and pop is not implemented by the browser
	if (!Array.prototype.push) {
		Array.prototype.push = function array_push() {
			for(var i=0;i<arguments.length;i++)
				this[this.length]=arguments[i];
			return this.length;
		}
	};
	if (!Array.prototype.pop) {
		Array.prototype.pop = function array_pop() {
			lastElement = this[this.length-1];
			this.length = Math.max(this.length-1,0);
			return lastElement;
		}
	};

	function setBoxStates( routingDown, countOnly) { with (this)
	{

	// Opera <7 fix... don't perform any actions in those browsers.
	if (!this.childNodes) return;

	e = e || window.event;
	var elm = e.srcElement || e.target;

	// Initial check: if the parent checkbox for a tree level has been clicked, trigger a
	// pre-emptive downwards route within that tree, and set returnValue to true so that we
	// don't repeat it or mess with any of the original checkbox's siblings.
	if (elm && elm.id && elm.id.match(/^check-(.*)/) && !routingDown && !e[treeObj.evtProcessed])
	{
	  var refTree = document.getElementById('tree-' + RegExp.$1);
	  if (refTree)
	  {
	   refTree.setBoxStates(e, true, countOnly);
	   e[treeObj.evtProcessed] = true;
	  }
	}

	  // Some counter and reference variables.
	var allChecked = true, boxCount = 0, subBoxes = null;
	// Get the name of this branch and see if the source element has id="check-xxxx".
	var thisLevel = this.id.match(/^tree-(.*)/)[1];
	var parBox = document.getElementById('check-' + thisLevel);

	// Loop through all children of all list elements inside this UL tag.
	for (var li = 0; li < childNodes.length; li++)
	{
	  for (var tag = 0; tag < childNodes[li].childNodes.length; tag++)
	  {
	   var child = childNodes[li].childNodes[tag];
	   if (!child) continue;
	   if (child.tagName && child.type && child.tagName.match(/^input/i) &&
	    child.type.match(/^checkbox/i))
	   {
	    // Set this box's state depending on its parent state, if we're routing downwards.
	    if (routingDown && parBox && elm && elm.id && elm.id.match(/^check-/) && !countOnly)
	     child.checked = parBox.checked;
	    // Count the checked boxes directly under this level.
	    allChecked &= child.checked;
	    if (child.checked) boxCount++;
	   }
	   // And route this event to sublevels, to update their nodes, during a downwards route.
	   if (child.tagName && child.tagName.match(/^ul/i) && (!e[treeObj.evtProcessed] || routingDown))
	    child.setBoxStates(e, true, countOnly);
	  }
	}

	// Once we've routed the event to all sublevels, set the 'returnValue' to true, so that
	// upper levels don't re-trigger a downwards route. This is a bit of a hack, admittedly :).
	if (!routingDown) e[treeObj.evtProcessed] = true;

	// Next, set the parent parBox state depending if all checkboxes in this menu are checked.
	// Of course, we don't set its state if it's the source of the event!
	if (parBox && parBox != elm && !countOnly) parBox.checked = allChecked;

	// If "countAllLevels" is set, overwrite the previous one-level-only count.
	if (treeObj.countAllLevels)
	{
	  boxCount = 0;
	  var subBoxes = this.getElementsByTagName('input');
	  for (var i = 0; i < subBoxes.length; i++) if (subBoxes[i].checked) boxCount++;
	}

	// Either way, assign the counted value to the id="count-xxx" page element.
	var countElm = document.getElementById('count-' + thisLevel);
	if (countElm)
	{
	  while (countElm.firstChild) countElm.removeChild(countElm.firstChild);
	  if (boxCount) countElm.appendChild(document.createTextNode(treeObj.checkFormat.replace('%n%',
	   boxCount)));
	}
	}};


	// checkYn  값을 체크하여 체크박스 값 부여
	function getCheck()
	{

		var i = 0;


	if(document.all.isCheck)
	{
		while(document.all.isCheck[i])
		{

			if(document.all.isCheck[i].value=='Y')
			{
				document.all.select[i].checked = true;
			}

			i++;
		}
	}


	}

