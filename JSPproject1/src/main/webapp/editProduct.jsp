<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%@ include file="dbconn.jsp"%>
		<div class="container pt-3">
			<h1 class="m-0 fw-bold">상품 편집</h1>
		</div>
	<div class="container">
		<div class="row d-flex flex-wrap" align="center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;	
			
				String sql = "select * from product";
				
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-sm-4">
				<div style="align-items: flex-end; width:160px; height:160px; ">
					<img src="./upload2/<%=rs.getString("p_fileName")%>" style="width: 100%">
				</div>
				<p><b><%=rs.getString("p_category")%></b></p>
				<b><%=rs.getString("p_name")%></b>
				<p><%=rs.getString("p_unitPrice")%>원</p>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"	class="btn btn-success" role="button"> 수정 &raquo;></a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제 &raquo;></a>
					<%
						}
					%>				
			</div>
			<%
				}
				if (rs != null)
					rs.close();
	 			if (pstmt != null)
	 				pstmt.close();
	 			if (conn != null)
					conn.close();
	 			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>