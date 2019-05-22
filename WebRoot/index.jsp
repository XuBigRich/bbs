<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Stack"%>
<%@page import="java.net.URLDecoder"%>
<html>
<head>
	<title>BBS论坛-注册/登录</title>
	<link type="text/css" rel="stylesheet" href="common.css">
</head>
<script language="javascript" src="time.js" charset="gbk"></script>
<script language="javascript">
function regist(){
	var a=document.frm.nam.value;
	var b=document.frm.pwd.value;
	
	var rega=/^[a-zA-Z0-9\W]{3,}$/;
	if(!rega.test(a)){
		alert("用户名至少3个字符组成");
		return false;
	}

	var regb=/^[a-zA-Z0-9]{3,}$/;
	if(!regb.test(b)){
		alert("密码至少3个字符组成");
		return false;
	}
	document.frm.action="regist.jsp";
	document.frm.submit();
}
</script>
<%
	if(application.getAttribute("users")==null){
		HashMap users=new HashMap();
		application.setAttribute("users",users);
	}
	if(application.getAttribute("txts")==null){
		Stack txts=new Stack();
		application.setAttribute("txts",txts);
	}
	
	String a="",b="";
	Cookie[] cs=request.getCookies();
	if(cs!=null){
		for(int i=0;i<cs.length;i++){
			if(cs[i].getName().equals("nam")){
				a=URLDecoder.decode(cs[i].getValue());
			}
			if(cs[i].getName().equals("pwd")){
				b=cs[i].getValue();
			}
		}
	}
%>
<body>
<center>
<form name="frm" action="login.jsp" method=post>
<table width=300 cellspacing=1>
	<tr><th colspan=2>登录/注册</th></tr>
	<tr>
		<th>用户名</th>
		<td><input type=text name="nam" value="<%=a %>"></td>
	</tr>
	<tr>
		<th>密码</th>
		<td><input type=password name="pwd" value="<%=b %>"></td>
	</tr>
	<tr>
		<th colspan=2>
			<input type=button value="注册" onclick=regist()>
			<input type=submit value="登录">
		</th>
	</tr>
</table>
</form>
<br>
<a href="show.jsp">投票</a>
</center>
</body>
</html>