<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<html>
<head>
	<title>投票结果</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">

</script>
<body>
<center>
<h2>投票结果</h2>
<table width=450 cellspacing=1>
<%
	HashMap mv=(HashMap)application.getAttribute("mv");
	
	int total=0;
	Iterator vs=mv.values().iterator();
	while(vs.hasNext()){
		total+=Integer.parseInt(vs.next()+"");
	}
	
	Iterator keys=mv.keySet().iterator();
	while(keys.hasNext()){
		String mvname=keys.next()+"";//电影名称
		int cnt=Integer.parseInt(mv.get(mvname)+"");//某电影票数
 %>
 		<tr>
 			<th width=150>《<%=mvname %>》</th>
 			<td class=left><span style="background-color:blue;height:15px;color:white;text-align:left;width:<%=cnt*1.0*300/total %>px;"><%=cnt %></span></td>
 		</tr>
 <%} %>
</table>
<br>
<a href="show.jsp">返回</a>
</center>
</body>
</html>