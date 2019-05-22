<%@page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.net.URLEncoder"%>
<html>
<head>
	<title>登录</title>
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
	if(users.containsKey(nam)&&users.get(nam).equals(pwd)){
		session.setAttribute("username",nam);//在session中做标志！！！
		
		Cookie c1=new Cookie("nam",URLEncoder.encode(nam));
		Cookie c2=new Cookie("pwd",pwd);
		c1.setMaxAge(60*60*24*15);//设定cookie超时时间，单位：秒
		c2.setMaxAge(60*60*24*15);//只有设定maxage，才会在客户端的文件中保存这个cookie
		response.addCookie(c1);
		response.addCookie(c2);
		
		response.sendRedirect("bbs.jsp");//不能请求转发，否则在bbs.jsp中刷新时，会重复登录
	} else {
%>
		<font color=red>用户名或密码错误</font>
		<br><br>
		<a href="index.jsp">返回重新登录</a>
<%} %>
</center>
</body>
</html>