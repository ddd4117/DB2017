<%@page import="DB.DB_Control"%>
<%@ page language="java" import="java.sql.*"%>
<%
	DB_Control db = new DB_Control();
	// 0: 인증 가능 사용자 및 비밀번호 목록.
	// 1: form 으로부터 전달된 데이터를 변수에 저장.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	boolean login_check = db.login(id, pw);
	
	String redirectUrl = "Login.html"; // 인증 실패시 재요청 될 url
	
	if (login_check) {
		session.setAttribute("database", db);
		session.setAttribute("signedUser", id); // 인증되었음 세션에 남김
		redirectUrl = "main_view.jsp";
	}
	else{
		//out.print("<script>alert('Login error!');</script>");
		System.out.println("Login error");
	}
	response.sendRedirect(redirectUrl);
%>