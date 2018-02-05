<%--
  Created by IntelliJ IDEA.
  User: LB
  Date: 2018/1/24
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/upload/fileUpload" method="post" enctype="multipart/form-data">
        <input type="text" name="productName" placeholder="输入商品名"/><br/>
        <input type="file" name="file"/><br/>
        <input type="submit" value="上传"/>
    </form>
</body>
</html>
