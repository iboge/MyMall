<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <%@include file="common.jsp"%>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <script type="text/javascript" src="${ctx}/static/lib/html5shiv.js"></script>
        <script type="text/javascript" src="${ctx}/static/lib/respond.min.js"></script>
        <link rel="stylesheet" type="text/css" href="${ctx}/static/static/h-ui/css/H-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/static/h-ui.admin/css/H-ui.admin.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/static/h-ui.admin/skin/default/skin.css" id="skin" />
        <link rel="stylesheet" type="text/css" href="${ctx}/static/static/h-ui.admin/css/style.css" />
        <script type="text/javascript" src="${ctx}/static/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
        <script>DD_belatedPNG.fix('*');</script>
        <title>我的桌面</title>
    </head>
    <body>
        <div class="page-container">
            <p class="f-20 text-success">欢迎使用H-ui.admin <span class="f-14">v3.1</span>后台模版！</p>
            <table class="table table-border table-bordered table-bg">
                <thead>
                <tr>
                    <th colspan="7" scope="col">信息统计</th>
                </tr>
                <tr class="text-c">
                    <th>统计</th>
                    <th>图片库</th>
                    <th>品牌库</th>
                    <th>产品库</th>
                    <th>会员</th>
                    <th>管理员</th>
                </tr>
                </thead>
                <tbody>
                <tr class="text-c">
                    <td>总数</td>
                    <c:forEach items="${requestScope.count}" var="count">
                        <td>${count.PictureCount}</td>
                        <td>${count.BrandCount}</td>
                        <td>${count.ProductCount}</td>
                        <td>${count.MemberCount}</td>
                        <td>${count.UserCount}</td>
                    </c:forEach>
                </tr>
                <tr class="text-c">
                    <td>今日</td>
                    <c:forEach items="${requestScope.count1}" var="count1">
                        <td>${count1.PictureCount1}</td>
                        <td>${count1.BrandCount1}</td>
                        <td>${count1.ProductCount1}</td>
                        <td>${count1.MemberCount1}</td>
                        <td>${count1.UserCount1}</td>
                    </c:forEach>
                </tr>
                <tr class="text-c">
                    <td>两天内</td>
                    <c:forEach items="${requestScope.count2}" var="count2">
                        <td>${count2.PictureCount2}</td>
                        <td>${count2.BrandCount2}</td>
                        <td>${count2.ProductCount2}</td>
                        <td>${count2.MemberCount2}</td>
                        <td>${count2.UserCount2}</td>
                    </c:forEach>
                </tr>
                <tr class="text-c">
                    <td>一周内</td>
                    <c:forEach items="${requestScope.count7}" var="count7">
                        <td>${count7.PictureCount7}</td>
                        <td>${count7.BrandCount7}</td>
                        <td>${count7.ProductCount7}</td>
                        <td>${count7.MemberCount7}</td>
                        <td>${count7.UserCount7}</td>
                    </c:forEach>
                </tr>
                <tr class="text-c">
                    <td>一月内</td>
                    <c:forEach items="${requestScope.count30}" var="count30">
                        <td>${count30.PictureCount30}</td>
                        <td>${count30.BrandCount30}</td>
                        <td>${count30.ProductCount30}</td>
                        <td>${count30.MemberCount30}</td>
                        <td>${count30.UserCount30}</td>
                    </c:forEach>
                </tr>
                </tbody>
            </table>
        </div>
        <footer class="footer mt-20">
            <div class="container">
                <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
                    Copyright &copy;2015-2017 H-ui.admin v3.1 All Rights Reserved.<br>
                    本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
            </div>
        </footer>
        <script type="text/javascript" src="${ctx}/static/lib/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/static/h-ui/js/H-ui.min.js"></script>
    </body>
</html>
