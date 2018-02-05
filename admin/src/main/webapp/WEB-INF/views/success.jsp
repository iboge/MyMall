<%--
  Created by IntelliJ IDEA.
  User: LB
  Date: 2018/1/24
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h4>${requestScope.imgUrl}</h4>
    <h4>${requestScope.productName}</h4>
    <img src="${requestScope.imgUrl}" alt="">
</body>
</html>
