<%@ page contentType="text/html;charset=utf-8"%>
<%@page import="java.util.HashMap"%>
<%
	boolean b=false;
	Cookie[] cs=request.getCookies();
	if(cs!=null){
		for(int i=0;i<cs.length;i++){
			if(cs[i].getName().equals("sign")){
				b=true;//表示已经投过票了
			}
		}
	}
	
	if(b==false){
		request.setCharacterEncoding("utf-8");
		String mvname=request.getParameter("r1");
		HashMap mv=(HashMap)application.getAttribute("mv");
		int cnt=Integer.parseInt(mv.get(mvname)+"")+1;
		mv.put(mvname,cnt);//真正的投票，即票数+1
		
		Cookie c=new Cookie("sign","xxxx");
		c.setMaxAge(15);
		response.addCookie(c);//做标记，表示已经投过票了
		
		response.sendRedirect("result.jsp");//不能请求转发!!!否则刷新result.jsp页会重复投票
	} else {
		out.println("<center>您已经投过票了<br><a href=result.jsp>查看结果</a></center>");
	}
%>