<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改密码</title>
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
                        <li class="active">修改密码</li>
                    </ol>
                </div>
                <!-- Table -->
               </br></br>
                <div class="row">
                    <div class="col-md-6 col-md-offset-1">
                        <form class="form-horizontal" id="changePWForm">
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">原密码</label>
                                <div class="col-sm-8">
                                    <input type="password" name="password" class="form-control" id="password" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newPassword" class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-8">
                                    <input type="password" name="newPassword" class="form-control" id="newPassword" placeholder="">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="newPassword2" class="col-sm-2 control-label">请重复输入新密码</label>
                                <div class="col-sm-8">
                                    <input type="password" class="form-control" id="newPassword2" placeholder="">
                                </div>
                            </div>
                            <div class="col-md-6 col-md-offset-2">
                                <button class="btn btn-default" type="submit" id="changePW_btn">提交</button>
                            </div>
                            <br>
                        </form>
                    </div>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->
        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<script type="text/javascript">


    function checkPW(){


    }


    $(function () {
        $("#changePW_btn").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}" + "/hrms/changePassword",
                type:"POST",
                data:$("#changePWForm").serialize(),
                success:function (result) {
                    window.location.href= "${pageContext.request.contextPath}"+"/hrms/main";
                }

            });
        });
    });
</script>
</body>
</html>
