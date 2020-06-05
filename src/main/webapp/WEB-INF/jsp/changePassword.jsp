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
                        <form class="form-horizontal add_emp_form">
                            <div class="form-group">
                                <label for="add_inputName" class="col-sm-2 control-label">姓名</label>
                                <div class="col-sm-8">
                                    <input type="text" name="empName" class="form-control" id="add_inputName" placeholder="如：张三">
                                    <span id="helpBlock_add_inputName" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_inputEmail" class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-8">
                                    <input type="email" name="empEmail" class="form-control" id="add_inputEmail" placeholder="zs@qq.com">
                                    <span id="helpBlock_add_inputEmail" class="help-block"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-8">
                                    <label class="radio-inline">
                                        <input type="radio" checked="checked" name="gender" id="add_inputGender1" value="M"> 男
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="gender" id="add_inputGender2" value="F"> 女
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="add_department" class="col-sm-2 control-label">部门</label>
                                <div class="col-sm-8">
                                    <div class="checkbox">
                                        <select class="form-control" name="departmentId" id="add_department">
                                            <%-- <option value="1">CEO</option>--%>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


            </div><!-- /.panel panel-success -->
        </div><!-- /.emp_info -->

        <!-- 尾部 -->
        <%@ include file="./commom/foot.jsp"%>
    </div><!-- /.hrms_body -->
</div><!-- /.container -->

<%@ include file="employeeAdd.jsp"%>
<%@ include file="employeeUpdate.jsp"%>


<script>
    <!-- ==========================员工删除操作=================================== -->
    $(".emp_delete_btn").click(function () {
        var curPage = ${curPage};
        var delEmpId = $(this).parent().parent().find("td:eq(0)").text();
        var delEmpName = $(this).parent().parent().find("td:eq(1)").text();
        if (confirm("确认删除【" + delEmpName+ "】的信息吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}" + "/hrms/emp/deleteEmp/"+delEmpId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href="/hrms/emp/getEmpList?pageNo="+curPage;
                    }else {
                        alert(result.extendInfo.emp_del_error);
                    }
                }
            });
        }
    });


</script>
</body>
</html>
