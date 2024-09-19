<%@ page language="java"%>
<%@ page contentType="text/html"%>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<%-- common include --%>
<%@ include file="/include/jsp_common_inc.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/loti.tld" prefix="loti"%>
<script language="JavaScript">
<!--
	
//-->
</script>
<table width="790" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td>
			<div class="ccGroup">
				<h2 class="hide">현재경로정보</h2>
				<h1>
					<img alt="설문결과" src="/images/poll/title_03-2.gif" />
				</h1>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div id="resultTable">
				<table width="750" border="0" cellspacing="0" cellpadding="0">
					<c:if test="${coursename !=null}">
						<tr>
							<td height="25" class="stitle">
								<img src='<html:rewrite page="/images/board/dot.gif"/>' width="20" height="12" align="absmiddle" alt="" />과정 :${coursename }
							</td>
						</tr>
					</c:if>
					<tr>
						<td>
							<html:form action="tstSatis.act?task=result">
								<input type="hidden" name="surveyno" value="${surveyno}">
								<input type="hidden" name="coursecode" value="${coursecode}">
								<!--검색 테이블 시작-->
								<%-- 
                  <table width="750" border="0" cellspacing="1" cellpadding="0" bgcolor="#E6E6E6">
                    <tr> 
                      <td bgcolor="#FFFFFF"> 
                        <table width="748" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <!--  <td width="89" class="s1">기관</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
										          <html:select property="searchOrgan" value="${searchOrgan}">
												      	<html:optionsCollection name="organCode" property="beanCollection" />
											      	</html:select>
                            </td>
                            <td class="sBar"></td>-->
                            <td width="89" class="s1">직렬</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
										          <html:select property="searchJob" value="${searchJob}">
												      	<html:optionsCollection name="jobCode" property="beanCollection" />
											      	</html:select>
                            </td>
                            <td class="sBar"></td>
                            <td width="89" class="s1">성별</td>
                            <td class="sBar"></td>
                            <td class="s2"> 
                              <html:select property="searchGender" value="${searchGender}">
                              	<html:option value="">전체</html:option>
                              	<html:option value="0">남자</html:option>
                              	<html:option value="1">여자</html:option>
                              </html:select>
                            </td>
                            <td width="60" align="center"><img src='<html:rewrite page="/images/board/btn_search.gif"/>' width="55" height="25" alt="검색" onclick="document.forms[0].submit();" style="cursor:hand"/></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
--%>
								<!--검색 테이블 끝-->
							</html:form>
						</td>
					</tr>
					<tr>
						<td height="15"></td>
					</tr>
					<tr>
						<td>
							<table width="750" border="0" cellspacing="0" cellpadding="0">
								<c:forEach var="itemList" items="${rsTst_Survey.itemlist}" varStatus="idx">
									<tr>
										<td>
											<!--설문타이틀-->
											<table width="750" border="0" cellspacing="0" cellpadding="0">
												<tr>
													<td colspan="5">
														<img src='<html:rewrite page="/images/poll/poll_top.gif"/>' width="750" height="5">
													</td>
												</tr>
												<tr>
													<td width="15px" background='<html:rewrite page="/images/poll/poll_left.gif"/>'>&nbsp;</td>
													<c:if test="${ itemList.replytype == 6}">
														<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' class="po1" width="570">
															<c:if test="${itemList.profno ne preProfno}">
																[${itemList.subjname }-${itemList.profname }]<br>
																<br>
															</c:if>
															${itemList.reqseq }.${itemList.itemcontents }
														</td>
														<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="100px" class="pJoin">총인원 : ${itemList.rsptcnt }명</td>
														<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="50px" class="pJoin">
															<fmt:formatNumber value="${itemList.itemscore }" pattern="#.#"></fmt:formatNumber>
														</td>
													</c:if>
													<c:if test="${ itemList.replytype != 6}">
														<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' class="po1" width="570">${itemList.reqseq }.${itemList.itemcontents }</td>
														<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="100px" class="pJoin">총인원 : ${itemList.rsptcnt }명</td>
														<c:if test="${ itemList.replytype == 5}">
															<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="50px" class="pJoin">
																<fmt:formatNumber value="${itemList.itemscore }" pattern="#.#"></fmt:formatNumber>
															</td>
														</c:if>
														<c:if test="${ itemList.replytype != 5}">
															<c:if test="${ itemList.scoreflag == 'Y'}">
																<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="50px" class="pJoin">
																	<fmt:formatNumber value="${itemList.itemscore }" pattern="#.#"></fmt:formatNumber>
																</td>
															</c:if>
															<c:if test="${ itemList.scoreflag != 'Y'}">
																<td background='<html:rewrite page="/images/poll/poll_bg.gif"/>' width="50px"></td>
															</c:if>
														</c:if>
													</c:if>
													<td width="15px" background='<html:rewrite page="/images/poll/poll_right.gif"/>'>&nbsp;</td>
												</tr>
												<tr>
													<td colspan="5">
														<img src='<html:rewrite page="/images/poll/poll_bottom.gif"/>' width="750" height="5">
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<c:if test="${itemList.replytype == 6 }">
										<tr>
											<td class="poNone">
												<!--답변리스트-->
												<table width="750" border="0" cellspacing="0" cellpadding="0">
													<c:forEach var="examList" items="${itemList.teacherlist}">
														<tr>
															<td class="pSubj">${examList.examcontents }</td>
															<td width="50" class="JoinP">${examList.replycnt }명</td>
															<td width="50" class="JoinP2">
																<c:if test="${examList.replycnt !=0}">
																	<fmt:formatNumber value="${(examList.replycnt/examList.itemcnt)*100 }" pattern="#.#"></fmt:formatNumber>%
																</c:if>
																<c:if test="${examList.replycnt ==0}">
																	0%
																</c:if>
															</td>
															<td width="50" class="JoinP3"></td>
															<td width="15">&nbsp;</td>
														</tr>
														<tr>
															<td class="poL" colspan="5"></td>
														</tr>
													</c:forEach>
												</table>
											</td>
										</tr>
										<c:set var="preProfno" value="${itemList.profno}" />
									</c:if>
									<c:if test="${itemList.replytype != 6 }">
										<tr>
											<td class="poNone">
												<!--답변리스트-->
												<table width="750" border="0" cellspacing="0" cellpadding="0">
													<c:forEach var="examList" items="${itemList.examlist}">
														<c:if test="${itemList.replytype <= 2 }">
															<tr>
																<td class="pSubj">${examList.examcontents }</td>
																<td width="50" class="JoinP">${examList.replycnt }명</td>
																<td width="50" class="JoinP2">
																	<c:if test="${examList.replycnt !=0 }">
																		<fmt:formatNumber value="${(examList.replycnt/itemList.replycnt)*100 }" pattern="#.#"></fmt:formatNumber>%
																	</c:if>
																	<c:if test="${examList.replycnt ==0 }">
																		0%
																	</c:if>
																</td>
																<td width="65">&nbsp;</td>
															</tr>
															<tr>
																<td class="poL" colspan="4"></td>
															</tr>
														</c:if>
														<c:if test="${itemList.replytype >= 5 }">
															<tr>
																<td class="pSubj">${examList.examcontents }</td>
																<td width="50" class="JoinP">${examList.examcnt }명</td>
																<td width="50" class="JoinP2">
																	<c:if test="${examList.replycnt !=0 }">
																		<fmt:formatNumber value="${(examList.replycnt/itemList.replycnt)*100 }" pattern="#.#"></fmt:formatNumber>%
																	</c:if>
																	<c:if test="${examList.replycnt ==0 }">
																		0%
																	</c:if>
																</td>
																<td width="50" class="JoinP3"></td>
																<td width="15">&nbsp;</td>
															</tr>
															<tr>
																<td class="poL" colspan="4"></td>
															</tr>
														</c:if>
														<c:if test="${itemList.replytype ==3 }">
															<tr>
																<td class="pSubj">
																	${examList.reply }
																</td>
															</tr>
															<tr>
																<td class="poL"></td>
															</tr>
														</c:if>
														<c:if test="${itemList.replytype ==4 }">
															<tr>
																<td class="pSubj">
																	${examList.reply }
																</td>
															</tr>
															<tr>
																<td class="poL"></td>
															</tr>
														</c:if>
													</c:forEach>
													<c:set var="othercnt" value="0" />
													<c:forEach items="${itemList.otherlist}" varStatus="cnt">
														<c:set var="othercnt" value="${cnt.count }" />
													</c:forEach>
													<c:if test="${othercnt != null && othercnt != 0}">
														<tr>
															<td class="pSubj">기타</td>
															<td width="50" class="JoinP">${othercnt}명</td>
															<td width="50" class="JoinP2">
																<c:if test="${othercnt !=0}">
																	<fmt:formatNumber value="${(othercnt/itemList.replycnt)*100 }" pattern="#.#"></fmt:formatNumber>%
																</c:if>
																<c:if test="${othercnt ==0}">
																	0%
																</c:if>
															</td>
															<td width="50" class="JoinP3"></td>
														</tr>
														<tr>
															<td class="poL" colspan="4"></td>
														</tr>
														<c:forEach var="otherList" items="${itemList.otherlist}">
															<tr>
																<td colspan="4"><input type="text" name="others" value="${otherList.other }"/></td>
															</tr>
															<tr>
																<td class="poL" colspan="4"></td>
															</tr>
														</c:forEach>
													</c:if>
												</table>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<!--하단버튼-->
							<table width="750" border="0" cellspacing="0" cellpadding="0" height="28">
								<tr valign="bottom">
									<td align="right">
										<img src='<html:rewrite page="/images/board/btn_list.gif"/>' width="57" height="25" align="absmiddle" alt="목록" onclick="history.go(-1)"
											style="cursor: hand" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
<script language="JavaScript">
<!--
	
//-->
</script>
