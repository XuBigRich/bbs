<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.Stack"%>
<html>
<head>
	<title>BBS论坛</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">
function chkFrm(){
	if(document.frm.txt.value==""){
		alert("发帖内容不能为空");
		return false;
	}
	return true;
}
</script>
<body>
<center>
<h1>BBS论坛</h1>
<table width=700 cellspacing=1>
<%
	Stack txts=(Stack)application.getAttribute("txts");
	for(int i=0;i<txts.size();i++){
		String txt=txts.get(i)+"";
		String[] ts=txt.split("#");
%>
		<tr style="height:120px;">
			<th rowspan=2 width=100><%=ts[0] %></th>
			<td colspan=2 style="text-align:left;vertical-align:top;padding:10px;"><%=ts[1] %></td>
		</tr>
		<tr>
			<th class=left style="padding-left:10px;"><%=ts[2] %></th>
			<th class=left style="padding-left:10px;"><%=ts[3] %></th>
		</tr>
<%} %>
</table>
<br>
<%if(session.getAttribute("username")!=null){ %>
	<form name="frm" action="addbbs.jsp" method="post" onsubmit="return chkFrm();">
		<textarea cols=73 rows=7 name="txt" style="border:1px solid black;"></textarea>
		<br><br>
		<input type=submit value="发 帖">
	</form>
<% }%>
</center>
</body>
</html>