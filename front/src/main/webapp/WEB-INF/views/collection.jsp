<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
        <title>我的收藏</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/personal.css" rel="stylesheet" type="text/css">
        <link href="${ctx}/static/css/colstyle.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <!--头 -->
        <%@include file="common/head.jsp"%>
        <b class="line"></b>
        <div class="center">
            <div style="margin-left: -100px" class="col-main">
                <div class="main-wrap">
                    <div class="user-collection">
                        <!--标题 -->
                        <div class="am-cf am-padding">
                            <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small></div>
                        </div>
                        <hr/>
                        <div class="you-like">
                            <div class="s-content">
                                <c:forEach items="${requestScope.favorites}" var="favorites">
                                    <div class="s-item-wrap">
                                    <div class="s-item">
                                        <div class="s-pic">
                                            <a href="${ctx}/searchProduct/searchId?id=${favorites.pid}" class="s-pic-link">
                                                <img src="${favorites.image}" alt="${favorites.name}" title="${favorites.name}" class="s-pic-img s-guess-item-img">
                                            </a>
                                        </div>
                                        <div class="s-info">
                                            <div class="s-title"><a href="${ctx}/searchProduct/searchId?id=${favorites.pid}" title="${favorites.name}">${favorites.name}</a></div>
                                            <div class="s-price-box">
                                                <span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${favorites.price}</em></span>
                                            </div>
                                        </div>
                                        <div class="s-tp">
                                            <span class="ui-btn-loading-before"><a href="${ctx}/searchProduct/searchId?id=${favorites.pid}">查看详情</a></span>
                                            <span class="ui-btn-loading-before buy"><a href="${ctx}/memberPay/delFavorites?id=${favorites.id}">取消收藏</a></span>
                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <!--底部-->
            </div>
        </div>
        <%@include file="common/foot.jsp"%>
    </body>
</html>