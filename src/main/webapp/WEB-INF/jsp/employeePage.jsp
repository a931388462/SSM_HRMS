<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人信息</title>
</head>
<body>
<div class="hrms_container">
    <!-- 导航条 -->
    <%@ include file="./commom/head.jsp"%>

    <!-- 中间部分（包括左边栏和员工/部门表单显示部分） -->
    <div class="hrms_body" style="position:relative; top:-15px;">

        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar.jsp"%>

        <!-- 中间员工表格信息展示内容 -->
        <div class="emp_info col-sm-10">

            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">个人中心</a></li>
                        <li class="active">用户信息</li>
                    </ol>
                </div>
                <!-- Table -->
                </br></br>
                <div class="row">
                    <div class="col-md-6 col-md-offset-1">
                        <form class="form-horizontal add_emp_form">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">头像</label>
                                <div class="col-sm-2">
                                    <img id="userPortrait" src="${pageContext.request.contextPath}/static/img/portrait/${USER.portrait}" alt="..." class="img-circle img-responsive">
                                </div>
                                <div class="col-sm-6">
                                    <input type="file" id="exampleInputFile">
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-default" id="chgPortrait_btn" type="button">更换</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="userName" class="col-sm-2 control-label">账号</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="userName" type="text" placeholder="您还没有账号" value="${USER.loginName}" readonly>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="namename" class="col-sm-2 control-label">用户名</label>
                                <div class="col-sm-8">
                                    <input class="form-control" id="namename" type="text" placeholder="您还没有用户名" value="${USER.empName}" readonly>
                                </div>
                                <div class="col-sm-2">
                                    <button class="btn btn-default" id="changeName_btn" type="button">更换</button>
                                </div>
                            </div>
                        </form>
                        <br>
                    </div>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->
        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<script>
    //避免重复提交
    var changFlag = false;
    //移除只读状态
    $("#changeName_btn").click(function(){
        $("#namename").removeAttr("readonly");
        changFlag = true;
    });

    //追加只读状态
    $("#namename").blur(function(){
        //避免重复提交
        if (changFlag){
            $("#namename").attr("readonly","readonly");
            $.ajax({
                url:"${pageContext.request.contextPath}" + "/hrms/chgNamename",
                type:"POST",
                data:{namename:$("#namename").val()},
                success:function (result) {
                    if(result.code == 100){
                        alert("修改成功");
                    }else {
                        alert(result.extendInfo.login_error);
                    }
                }
            })
            changFlag = false;
        }
    });

    //头像变更
    $("#chgPortrait_btn").click(function(){
        var formData = new FormData();
        var file = $("#exampleInputFile")[0].files[0];
        if (file == null){
            alert("请选择一张图片")
            return;
        }
        formData.append("file",$("#exampleInputFile")[0].files[0]);
        $.ajax({
            url:"${pageContext.request.contextPath}" + "/hrms/uploadAvatar",
            type:'post',
            data: formData,
            contentType: false,
            processData: false,
            success:function(result){
                alert("上传成功");
                $("#userPortrait").attr('src',"${pageContext.request.contextPath}/static/img/portrait/"+result.extendInfo.picname);
            }
        })
    });






</script>
</body>
</html>