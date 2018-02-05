<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
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
    <title>品牌管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 分类管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="text-c">
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a class="btn btn-primary radius" href="${ctx}/product/addCategory"><i class="Hui-iconfont">&#xe600;</i> 添加分类</a></span> <span class="r">共有数据：<strong>${requestScope.size}</strong> 条</span> </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="70">ID</th>
                <th width="120">分类名称</th>
                <th width="120">分类所有品牌</th>
                <th width="120">分类添加时间</th>
                <th width="200">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.category}" var="category">
                <tr class="text-c">
                    <td><input name="" type="checkbox" value=""></td>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                    <td>
                        <c:forEach items="${requestScope.bca}" var="bca">
                            <c:if test="${category.name==bca.cname}">
                                <p>${bca.bname}</p>
                            </c:if>
                        </c:forEach>
                    </td>
                    <td>${category.createtime}</td>
                    <c:if test="${category.status==1}">
                        <td class="td-status"><span class="label label-success radius">已启用</span></td>
                        <td class="td-manage">
                            <a href="${ctx}/product/queryCById?id=${category.id}"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a style="text-decoration:none" onClick="member_stop(this,${category.id})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a></td>
                    </c:if>
                    <c:if test="${category.status==0}">
                        <td class="td-status"><span class="label label-danger radius">已冻结</span></td>
                        <td class="td-manage">
                            <a href="${ctx}/product/queryCById?id=${category.id}"><i class="Hui-iconfont">&#xe6df;</i></a>
                            <a style="text-decoration:none" href="javascript:;" onClick="member_start(this,${category.id})" title="启用"><i class="Hui-iconfont">&#xe66b;</i></a></td>
                    </c:if>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="${ctx}/static/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${ctx}/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 1, "desc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[0,6]}// 制定列不参与排序
        ]
    });
    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            console.log(id);
            var data={
                id:id,
                status:'0'
            };
            $.ajax({
                url: '${ctx}/product/changeCS',
                type: 'POST',
                data: data,
                success:function(result){
                    if(result.msg) {
                        layer.msg('已停用!', {icon: 5, time: 1000});
                        location.replace(location.href);
                    }
                },
                error:function(result) {
                    console.log(result.msg);
                },
            });
        });
    }

    /*用户-启用*/
    function member_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            console.log(id);
            var data={
                id:id,
                status:'1'
            };
            $.ajax({
                url: '${ctx}/product/changeCS',
                type: 'POST',
                data: data,
                success: function(result){
                    if(result.msg) {
                        layer.msg('已启用!', {icon: 6, time: 1000});
                        location.replace(location.href);
                    }
                },
                error:function(result) {
                    console.log(result.msg);
                },
            });
        });
    }
</script>
</body>
</html>
