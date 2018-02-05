<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%@include file="common/common.jsp"%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
    <title>评价管理</title>
    <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${ctx}/static/css/cmstyle.css" rel="stylesheet" type="text/css">
    <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctx}/static/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/static/layer/layer.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".del").click(function () {
                var id = $(this).next().val();
                console.log(id);
                $.ajax({
                    url:"${ctx}/member/delEvaluate",
                    type:"post",
                    data:{id:id},
                    success:function (result) {
                        if(result.msg){
                            layer.alert("success");
                            location.reload();
                        }
                    }
                })
            })
        })
    </script>
</head>
<body>
<%@include file="common/head.jsp"%>
<b class="line"></b>
<div style="margin-right: 150px" class="center">
    <div class="col-main">
        <div class="main-wrap">
            <div class="user-comment">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
                </div>
                <hr/>
                <div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-fade am-in am-active" id="tab1">
                            <div class="comment-main">
                                <div class="comment-list">
                                    <ul class="item-list">
                                        <div class="comment-top">
                                            <div class="th th-price">
                                                <td class="td-inner">评价</td>
                                            </div>
                                            <div class="th th-item">
                                                <td class="td-inner">商品</td>
                                            </div>
                                        </div>
                                        <c:forEach items="${requestScope.evaluate}" var="evaluate">
                                        <li class="td td-item">
                                            <div class="item-pic">
                                                <a href="#" class="J_MakePoint">
                                                    <img src="${evaluate.image}" class="itempic">
                                                </a>
                                            </div>
                                        </li>
                                            <hr/>
                                        <li class="td td-comment">
                                            <div class="item-title">
                                                <div class="item-opinion"></div>
                                                <div class="item-name">
                                                    <p style="color: black" class="item-basic-info">${evaluate.pname}</p>
                                                </div>
                                            </div>
                                            <div class="item-comment">
                                                ${evaluate.evaluates}
                                            </div>
                                            <div class="item-info">
                                                <div>
                                                    <p class="info-little"><span></span> <span style="color: #FF0000"><input type="button" class="del" value="删除"/><input type="hidden" value="${evaluate.id}"/></span> </p>
                                                    <p class="info-time">${evaluate.createtime}</p>
                                                </div>
                                            </div>
                                        </li>
                                            <hr/>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="common/foot.jsp"%>
</body>
</html>