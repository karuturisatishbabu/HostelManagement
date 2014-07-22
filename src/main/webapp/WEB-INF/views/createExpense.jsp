<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.error{
color:red
}
</style>
</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	//$("#first").hide();
});

function onSubmit(){
	
	if(isFormContainsErrors()){
		return false;
	}

	return true;
	
}
function isFormContainsErrors(){
	var expense=$("#expense").val();
	var amount=$("#amount").val();
	var date=$("#date").val();
	if(expense==''){
		$("#expense_error").html("expense ie required");
		return true;
	}
	if(amount==''){
		$("#amount_error").html("amount is required");
		return true;
	}
	if(date==''){
		$("#date_error").html("date is required");
	}
	
}
</script>
</head>
<body>
<form:form action="${pageContext.servletContext.contextPath}/web/form/createExpense" method="post" modelAttribute="expense">
<table>
<tr>
<td>Reason</td> <td> <form:input path="expense"/></td><td><span class="error"><form:errors path="expense"></form:errors></span>
<td><span id="expense_error" class="error"><form:errors path="expense"></form:errors></span></td>
</tr>
<tr>
<td>Amount</td> <td> <form:input path="amount"/><td><span class="error"><form:errors path="amount"></form:errors></span></td>
<td><span id="amount_error" class="error"><form:errors path="amount"></form:errors></span></td>
</tr>
<tr>
<td>Date</td> <td> <form:input path="date"/></td>
<td><span id="date_error" class="error"><form:errors path="date"></form:errors></span></td>
</tr>

<tr>
<td><input type="submit" name="submit" value="Submit"></td>
</tr>
</table>

</form:form>
</body>
</html>