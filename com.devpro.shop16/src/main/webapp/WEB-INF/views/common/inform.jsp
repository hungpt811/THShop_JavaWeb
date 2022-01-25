<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- taglib JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty TB_SUCCESS }">
	<div class="row">
		<div class="col">
			<div class="alert alert-success">${success}</div>
		</div>
	</div>
</c:if>

<c:if test="${not empty TB_ERROR }">
	<div class="row">
		<div class="col">
			<div class="alert alert-success">${error}</div>
		</div>
	</div>
</c:if>