<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--顶部导航条 -->
<html>
    <head>
        <title></title>
        <script type="text/javascript" src="${ctx}/static/js/jquery-1.7.2.min.js"></script>
        <script type="text/javascript">
            /*$(function () {
                $("#ai-topsearch").click(function () {
                    var name = $("#searchInput").val();
                    if(name!=""){
                        $.ajax({
                            url:"/searchProduct/search",
                            type:"post",
                            data:{
                                name:name
                            },
                            success:function (result) {

                            },
                            error:function () {

                            }
                        })
                    }else{
                        alert("请输入关键字！")
                    }
                })
            })*/
        </script>
    </head>
    <body>
        <div class="hmtop">
            <div class="am-container header">
                <ul class="message-l">
                    <div class="topMessage">
                        <div class="menu-hd">
                            <c:choose>
                                <c:when test="${sessionScope.member!=null}">
                                    <a href="${ctx}/member/person" target="_top" class="h">欢迎${sessionScope.member.name}登录</a>
                                    <a href="${ctx}/member/logout" target="_top">注销</a>
                                </c:when>
                                <c:otherwise>
                                <a href="${ctx}/login.jsp" target="_top" class="h">登录</a>
                                <a href="${ctx}/register.jsp" target="_top">免费注册</a>
                            </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </ul>
                <ul class="message-r">
                    <div class="topMessage home">
                        <div class="menu-hd"><a href="${ctx}/searchProduct/home" target="_top" class="h">商城首页</a></div>
                    </div>
                    <div class="topMessage my-shangcheng">
                        <div class="menu-hd MyShangcheng"><a href="${ctx}/memberPay/getOrder" target="_top"><i class="am-icon-user am-icon-fw"></i>我的订单</a></div>
                    </div>
                    <div class="topMessage mini-cart">
                        <div class="menu-hd"><a id="mc-menu-hd" href="${ctx}/memberPay/getCart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
                    </div>
                    <div class="topMessage favorite">
                        <div class="menu-hd"><a href="${ctx}/memberPay/getFavorites" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
                    </div>
                </ul>
            </div>
            <!--悬浮搜索框-->
            <div class="nav white">
                <div class="search-bar pr">
                    <form action="${ctx}/searchProduct/query" method="post">
                        <input name="s" id="searchInput" type="text" placeholder="请输入您要搜索的产品关键字" autocomplete="off">
                        <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
                    </form>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </body>
</html>
