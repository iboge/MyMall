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
    <title>栏目设置</title>
</head>
<body>
<div class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-category-add">
        <div id="tab-category" class="HuiTab">
            <div class="tabCon">
                <input type="hidden" name="id" value="${requestScope.brand.id}"/>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">
                        <span class="c-red"></span>
                        品牌名称：</label>
                    <div class="formControls col-xs-8 col-sm-9">
                        <input type="hidden" name="id" value="${requestScope.brand.id}"/>
                        <input type="text" readonly="readonly" class="input-text" value="${requestScope.brand.name}" placeholder="" id="1" name="bname">
                    </div>
                    <div class="col-3">
                    </div>
                </div>
                <div class="row cl">
                    <label class="form-label col-xs-4 col-sm-3">赋予分类：</label>
                    <div class="formControls col-xs-8 col-sm-9">
						<table class="table table-border table-bordered">
                            <thead>
                                <th width="25"></th>
                                <th width="70">分类 ID</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.category}" var="category">
                                    <tr>
                                        <td><input name="aaa" type="checkbox" value="${category.id}" <c:if test="${category.checked == true}"> checked </c:if>/> </td>
                                        <td>${category.name}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-3">
                    </div>
                </div>
            </div>
        </div>
        <div class="row cl">
            <div class="col-9 col-offset-3">
                <input class="btn btn-primary radius" name="tijiao" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="${ctx}/static/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="${ctx}/static/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="${ctx}/static/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function(){

        $("input[name='tijiao']").click(function () {
            var id = $("input[name='id']").val();
            var ids = [];
            $("input[name='aaa']:checked").each(function () {
                ids.push($(this).val());
            });
            console.log(id);
            console.log(ids);
            var data={
                id:id,
                ids:ids
            };
            $.ajax({
                url:"${ctx}/product/editBrand",
                type:"post",
                data:data,
                traditional: true,
                success:function (result) {
                    location="${ctx}/product/queryBrand";
                }
            })
        });

        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#tab-category").Huitab({
            index:0
        });
        $("#form-category-add").validate({
            rules:{

            },
            onkeyup:false,
            focusCleanup:true,
            success:"valid",
            submitHandler:function(form){
                //$(form).ajaxSubmit();
                var index = parent.layer.getFrameIndex(window.name);
                //parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
</body>
</html>