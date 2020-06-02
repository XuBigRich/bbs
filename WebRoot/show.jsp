<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
	<title>投票</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">

</script>
<%
	if(application.getAttribute("mv")==null){
		HashMap mv=new HashMap();
		mv.put("阿甘正传",0);//每部电影默认是0票
		mv.put("夺面双雄",0);
		mv.put("霸王别姬",0);
		mv.put("肖申克的救赎",0);
		application.setAttribute("mv",mv);
	}
 %>
<body>
<center>
<h2>你最喜欢的电影是哪一部？</h2>
<form action="toupiao.jsp" method="post">
<table width=400 cellspacing=1>
	<tr>
		<th><input type=radio class=nob name="r1" value="阿甘正传" checked></th>
		<td>《阿甘正传》</td>
	</tr>
	<tr>
		<th><input type=radio class=nob name="r1" value="夺面双雄"></th>
		<td>《夺面双雄》</td>
	</tr>
	<tr>
		<th><input type=radio class=nob name="r1" value="霸王别姬"></th>
		<td>《霸王别姬》</td>
	</tr>
	<tr>
		<th><input type=radio class=nob name="r1" value="肖申克的救赎"></th>
		<td>《肖申克的救赎》</td>
	</tr>
	<tr><th colspan=2><input type=submit value="投票"></th></tr>
</table>
</form>
</center>
</body>
</html>