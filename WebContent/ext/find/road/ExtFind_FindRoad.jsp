<%@ page language="java" %>
<%@ page contentType="text/html" %>
<%@ page pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>찾아오시는길</title>
<style type="text/css">
*{margin:0; padding:0;}
body, input, textarea, select, button{font-family: dotum,"돋움",NanumGothic; font-size: 12px; letter-spacing: 0px; line-height: 120%; margin:10px 10px;}
img{border:0;}
.map{color:#666666; width:725px;}
.map h2{background:url(/images/course/hIconBg.png) no-repeat scroll left 8px transparent; font-size:13px; color:#00639a; padding:10px 0 10px 20px;}
.map h3{line-height:140%; margin:0px 0 0 8px; padding:0px 0 5px 18px; background:url(/images/course/hIconBg.png) no-repeat 0 -51px; font-size:13px; color:#0c88a1;}
.map ul{margin:3px 0 0; padding:0 15px; list-style:none;}
.map ul li{line-height: 140%; background:url(/images/course/liImg.gif) no-repeat scroll 0 2px transparent; padding:0 0 0 15px;}
.map p{line-height:140%; margin-bottom:10px; padding:0 20px;}
caption {font-size: 0; height: 1px; line-height: 0; overflow: hidden; position: absolute; visibility: hidden; width: 1px;}
.map  table{width:100%; border: 0; background:none; *background:none; margin-bottom: 10px; border-top:3px solid #1f7ce9;}
.map  table th{padding:0; color: #1f7ce9; text-align:center; background:none; font-family: NanumGothicExtraBold; line-height:130%; border-left:1px #e8e8e5 solid;}
.map  table td{border-bottom: 1px #e8e8e5 solid; border-left: 1px #e8e8e5 solid;text-align:left; padding: 7px; background:none; color: #555555; line-height:130%; letter-spacing:0;}
.map  table th.first{background: none; border-left:medium none;}
.map table tbody th.first{background:url(/static/common/images/thBg.gif) repeat-x left 4px; border-bottom: 1px #e8e8e5 solid; bo}

</style>
</head>

<body>
<div class="map">
<h2>찾아오시는길</h2>
<img src="/images/course/map.gif" alt="자세한 사항은 하단참조" />
<h2>교통안내</h2>
<h3>버스</h3>
<ul>
  <li>청주, 충청북도 자치연수원간 시내버스 이용 (청원 가덕 교통연수원 하차)</li>
  <li>노선번호
    <ul>
      <li>미원(207번, 211번), 미동산수목원(207-1번), 화창(218번), 금거리(215번), 퉁점(215-1번) 대덕(280번)</li>
      <li>버스요금 : 1,400원 (좌석 및 시내버스 동일)</li>
    </ul>
  </li>
</ul>
<h3>승용차</h3>
<ul>
  <li><strong><font color="#0C88A1">청주 IC 방면</font></strong> -  청주방면 - 터미널 사거리에서 우회전, 우회도로진입 - HCN방면 직진 - 지북교차로에서 우회전,
    운전면허시험장 방면 - 가덕초등학교 - 상정교 교차로에서 좌회전 - 충청북도 자치연수원 도착</li>
  <li><strong><font color="#0C88A1">청원 IC 방면</font></strong> - 청주방면 좌회전 - 가마교차로에서 우회전, HCN방면 - 지북교차로에서 우회전, 운전면허시험장 방면
    - 가덕초등학교 - 상정교 교차로에서 좌회전 - 충청북도 자치연수원 도착</li>
  <li><strong><font color="#0C88A1">문의 IC 방면</font></strong> - 청주방면 우회전 - 직진 후 고은 삼거리에서 우회전 (보은,미원 방면 ) 
    - 가덕초등학교 - 상정교 교차로에서 좌회전 - 충청북도 자치연수원 도착
    <ul>
    <li>문의IC-고은삼거리 ▶ 약 5km</li>
    <li>고은삼거리-자치연수원 ▶ 약10km </li>
    </ul>
    </li>
</ul>
<h3>통근버스</h3>
<p>통근버스 운행노선(차량번호 76보 5968) / 노선문의 : 043-220-5425</p>
<table cellspacing="0" cellpadding="0" summary="통근버스에 관한 안내 표 입니다" class="center">
  <caption>
  통근버스
  </caption>
 
  <tbody>
    <tr>
      <th class="first">07:30</th>
      <td>도 여성발전센터 출발(지북동)</td>
    </tr>
    <tr>
      <th class="first">07:40</th>
      <td>산남동 남부시외버스터미널</td>
    </tr>
    <tr>
      <th class="first">07:42</th>
      <td>CBS앞</td>
    </tr>
    <tr>
      <th class="first">07:52</th>
      <td>사창사거리 청주고용지원센터 맞은편</td>
    </tr>
    <tr>
      <th class="first">07:55</th>
      <td>봉명동 GS주유소 앞</td>
    </tr>
    <tr>
      <th class="first">07:58</th>
      <td>국민건강보험공단 맞은편</td>
    </tr>
    <tr>
      <th class="first">08:03</th>
      <td>북부터미널 앞(상당구청 맞은편)</td>
    </tr>
    <tr>
      <th class="first">08:05</th>
      <td>청대사거리 신용협동조합 앞</td>
    </tr>
    <tr>
      <th class="first">08:10</th>
      <td>도청 서문앞 보문당 앞</td>
    </tr>
    <tr>
      <th class="first">08:13</th>
      <td>육거리 우신농기계 앞</td>
    </tr>
    <tr>
      <th class="first">08:18</th>
      <td>용암동 대청주유소 방향 명문레저낚시 앞</td>
    </tr>
    <tr>
      <th class="first">08:40</th>
      <td>충청북도 자치연수원 도착</td>
    </tr>
  </tbody>
</table>
<p>※ 가는길(퇴근시 18:10분) : 연수원출발 →용암동 -> 육거리 -> 도청 -> 사직사거리 -> CJB -> 교대 -> 방서사거리 -> 차고지 </p>
</div>
</body>