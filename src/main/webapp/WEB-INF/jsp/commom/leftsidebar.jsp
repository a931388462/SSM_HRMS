<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true">个人中心</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_emp">
                <li role="presentation"><a href="#" class="emp_info">用户信息</a></li>
                <li role="presentation"><a href="#" class="changPassword">修改密码</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">数据查询</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dept">
                <li role="presentation"><a href="#" class="dept_info">数据一览</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">xxxx</a></li>
                <li role="presentation"><a href="#" class="dept_clearall_btn">xxxx</a></li>
            </ul>
        </li>
    </ul>

</div><!-- /.panel-group，#hrms_sidebar_left -->

<script type="text/javascript">
    //跳转到用户信息
    $(".emp_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}"+"/hrms/emp/getEmpList");
    });
    //跳转到修改密码
    $(".changPassword").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}"+"/hrms/changePasswordPage");
    });
    //跳转到部门页面
    $(".dept_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}"+"/hrms/dept/getDeptList");
    });
    //部门清零这个功能暂未实现
    $(".dept_clearall_btn").click(function () {
        alert("对不起，您暂无权限进行操作！请先获取权限");
    });
</script>
</body>
</html>
