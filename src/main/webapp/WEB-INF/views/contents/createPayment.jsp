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
	var actualAmount=$("#actualAmount").val();
	var paidAmount=$("#paidAmount").val();
	var actualDate=$("#actualDate").val();
	var paidDate=$("#paidDate").val();
	if(actualAmount==''){
		$("#actualAmount_error").html("actual amount is required");
		return true;
	}
	if(paidAmount==''){
		$("#paidAmount_error").html("paid amount is required");
		return true;
	}
	if(actualDate==''){
		$("#actualDate_error").html("actual date is required");
		return true;
	}
	if(paidDate==''){
		$("#paidDate_error").html("paid date is required");
		return true;
	}
	
}
</Script>
</head>
<body>
<body>

<form:form action="${pageContext.servletContext.contextPath}/web/form/createPayment" method="post" modelAttribute="payments" onsubmit="return onSubmit()">
<input type="hidden" name="hostlerId" value="${hostlerId}"/>
<table>


<tr>


<td>ActualAmount</td><td>     <form:input path="actualAmount"/></td>
<td><span id="actualAmount_error" class="error"><form:errors path="actualAmount"></form:errors></span></td>

<td>Paid Amount</td><td>      <form:input path="paidAmount"/></td>
<td><span id="paidAmount_error" class="error"><form:errors path="paidAmount"></form:errors></span></td>

</tr>

<tr>
<td>ActualDate</td>        <td>   <form:input path="actualDate" value="${actualDate}"/></td>
<td><span id="actualDate_error" class="error"><form:errors path="actualDate"></form:errors></span></td>
</tr>
<tr>
<td>PaidDate </td>      <td>    <form:input path="paidDate"/></td>
<td><span id="paidDate_error" class="error"><form:errors path="paidDate"></form:errors></span></td>
</tr>
<!-- <tr>
<td>hostlerId</td><td> <input type="text" name="hostlerId"></td>
</tr> -->
<tr>
<td><input type="submit" name="submit" value="Submit"></td>
</tr>
</table>
</form:form>

</body>
</html>