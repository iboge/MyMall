<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>搜索页面</title>
        <%@include file="common/common.jsp"%>
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/basic/css/demo.css" rel="stylesheet" type="text/css" />
        <link href="${ctx}/static/css/seastyle.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${ctx}/static/basic/js/jquery-1.7.min.js"></script>
        <script type="text/javascript" src="${ctx}/static/js/script.js"></script>
    </head>
    <body>
        <%@include file="common/head.jsp"%>
        <div class="clear"></div>
        <b class="line"></b>
        <div class="search">
            <div class="search-list">
                <div style="margin-top:50px;" class="am-g am-g-fixed">
                    <div class="am-u-sm-12 am-u-md-12">
                        <div class="theme-popover">
                            <ul class="select">
                                <li class="select-list">
                                    <dl id="select1">
                                        <dt class="am-badge am-round">品牌</dt>
                                        <div class="dd-conent">
                                            <dd class="select-all"><a href="${ctx}/searchProduct/query?id=&cid=${requestScope.cid}">全部</a></dd>
                                            <c:forEach items="${applicationScope.brands}" var="brands">
                                                <dd><a href="${ctx}/searchProduct/query?bid=${brands.id}&cid=${requestScope.cid}">${brands.name}</a></dd>
                                            </c:forEach>
                                        </div>
                                    </dl>
                                </li>
                                <li class="select-list">
                                    <dl id="select2">
                                        <dt class="am-badge am-round">种类</dt>
                                        <div class="dd-conent">
                                            <dd class="select-all"><a href="${ctx}/searchProduct/query?id=&bid=${requestScope.bid}">全部</a></dd>
                                            <c:forEach items="${applicationScope.categorys}" var="category">
                                                <dd><a href="${ctx}/searchProduct/query?cid=${category.id}&bid=${requestScope.bid}">${category.name}</a></dd>
                                            </c:forEach>
                                        </div>
                                    </dl>
                                </li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                        <div class="search-content">
                            <div class="sort">
                                <li>小二 共为您找到了 ${requestScope.count}<%--${requestScope.size}--%> 件商品</li>
                            </div>
                            <div class="clear"></div>
                            <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                                <c:forEach items="${requestScope.products}" var="products">
                                    <li><a href="${ctx}/searchProduct/searchId?id=${products.id}"/>
                                        <div class="i-pic limit">
                                            <a href="${ctx}/searchProduct/searchId?id=${products.id}"><img src="${products.image}" /></a>
                                            <a href="${ctx}/searchProduct/searchId?id=${products.id}"><p class="title fl">${products.name}</p></a>
                                            <p class="price fl">
                                                <b>￥</b>
                                                <strong>${products.price}</strong>
                                            </p>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="search-side">
                            <div class="side-title">
                                销量排行推荐
                            </div>
                            <c:forEach items="${requestScope.productSales}" var="product" end="1">
                                <li>
                                    <div class="i-pic check">
                                        <a href="${ctx}/searchProduct/searchId?id=${product.id}"><img src="${product.image}" /></a>
                                        <p class="check-title" style="font-size: 14px">${product.name}</p>
                                        <p class="price fl">
                                            <b>￥</b>
                                            <strong>${product.price}</strong>
                                        </p>
                                    </div>
                                </li>
                            </c:forEach>
                        </div>
                        <div class="clear"></div>
                        <!--分页 -->
                        <ul style="text-align: center" class="am-pagination am-pagination-right">
                            <c:forEach begin="1" end="${requestScope.page}" step="1" varStatus="status">
                                <li><a class="index" href="${ctx}/searchProduct/query?start=${status.index}&s=${requestScope.s}&cid=${requestScope.cid}&bid=${requestScope.bid}">${status.index}</a></li>
                            </c:forEach>
                            <span>共：${requestScope.page}页，当前为第${requestScope.start}页</span>
                        </ul>
                    </div>
                </div>
                <%@include file="common/foot.jsp"%>
            </div>
        </div>
    </body>
</html>