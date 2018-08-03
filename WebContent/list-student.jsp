<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, com.luv2code.web.jdbc.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Tracker App</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>

<%
	// get the student from request object(send by servlet)
	List<Student> theStudents = 
			(List<Student>) request.getAttribute("STUDENT_LIST");
%>

<body>
	
<div id="wrapper">
		<div id="header">
			<h2>FooBar University</h2>
		</div>
	</div>

	<div id="container">
	
		<div id="content">
		
			<!-- put new button Add student -->
			
			<input type="button" value="Add student"
				onclick="window.location.href='add-student-form.jsp';return false;"
				class="add-student-button">
			
			<table>
			
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<c:forEach var="tempStudent" items="${STUDENT_LIST}">
				
					<!-- set up a link for update each student -->
					<c:url var="tempLink" value="StudentControllerServlet">
						<c:param name="command" value="LOAD"></c:param>
						<c:param name="studentId" value="${tempStudent.id }"></c:param>
					</c:url>
							
					<!-- set up a link for delete each student -->
					<c:url var="deleteLink" value="StudentControllerServlet">
						<c:param name="command" value="DELETE"></c:param>
						<c:param name="studentId" value="${tempStudent.id }"></c:param>
					</c:url>
					
					<tr>
						<td> ${tempStudent.firstName } </td>
						<td> ${tempStudent.lastName } </td>
						<td> ${tempStudent.email } </td>
						<td> 
							<a href="${tempLink }">Update</a>
							|
							<a href="${deleteLink }"
							onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">
							Delete</a>
						</td> 
					</tr>
				
				</c:forEach>
				
			</table>
		
		</div>
	
	</div>

</body>
</html>