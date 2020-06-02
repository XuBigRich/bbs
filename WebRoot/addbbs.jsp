<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.Stack"%>
<%@page import="java.util.Date"%>
<html>
<head>
	<title>发表</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">

</script>
<body>
<center>
<% 
	if(session.getAttribute("username")!=null){
		request.setCharacterEncoding("utf-8"); 
		Stack txts=(Stack)application.getAttribute("txts"); 
		 
		String nam=session.getAttribute("username")+""; 
		String txt=request.getParameter("txt"); 
		String tim=new Date().toLocaleString();
		String ip=request.getRemoteAddr();
		
		txts.push(nam+"#"+txt+"#"+tim+"#"+ip);
		response.sendRedirect("bbs.jsp");//不能请求转发，否则刷新时，会重复发表
	} else {
 %>
 		<font color=red>没有登录，不能发表</font>
 		<a href="index.jsp">返回登录</a>
 <%} %>
</center>
</body>
</html>