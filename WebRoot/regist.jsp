<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<html>
<head>
	<title>注册</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">

</script>
<body>
<center>
<%
	request.setCharacterEncoding("utf-8");
	String nam=request.getParameter("nam");
	String pwd=request.getParameter("pwd");
	HashMap users=(HashMap)application.getAttribute("users");
	if(!users.containsKey(nam)){
		users.put(nam,pwd);//注册
		out.println("<font color=green>注册成功</font>");
		out.println("<a href=index.jsp>登录</a>");
	} else {
		out.println("<font color=red>该用户名已经被占用</font>");
		out.println("<a href=index.jsp>返回重新注册</a>");
	}
 %>
</center>
</body>
</html>