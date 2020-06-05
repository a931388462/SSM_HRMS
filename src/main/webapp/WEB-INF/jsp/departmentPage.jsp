<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>部门管理页面</title>
</head>
<body>
<div class="hrms_dept_container">
    <!-- 导航栏-->
    <%@ include file="./commom/head.jsp"%>


    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_dept_body">
        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar.jsp"%>

        <!-- 部门表格内容 -->
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">数据查询</a></li>
                        <li class="active">数据一览</li>
                    </ol>
                </div>
                <!-- Table -->
                <div class="row" style="margin-top: 10px">
                    <div class="col-md-3 col-md-push-9">
                        <form class="form-inline">
                            <div class="form-group">
                            <select class="form-control">
                                <option>2020 6-6</option>
                                <option>2020 6-5</option>
                            </select>
                    </div>
                            <div class="form-group">
                                <select class="form-control">
                                    <option>设备a</option>
                                    <option>设备b</option>
                                </select>
                            </div>
                        </form>
                    </div>
                </div>
                <table class="table table-bordered table-hover" id="dept_table">
                    <thead>
                        <th>设备名</th>
                        <th>时间</th>
                        <th>温度(℃)</th>
                        <th>湿度(%)</th>
                        <th>粉尘浓度(mg/m³)</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${departments}" var="dept">
                            <tr>
                                <td>设备a</td>
                                <td>2020 6-4 20:00</td>
                                <td>9</td>
                                <td>46</td>
                                <td>6.5</td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>设备b</td>
                            <td>2020 6-5 20:00</td>
                            <td class="warning">99</td>
                            <td>99</td>
                            <td>99.5</td>
                        </tr>
                    </tbody>
                </table>

                <div class="panel-body">
                    <div class="table_items">
                        当前第<span class="badge">${curPageNo}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
                    </div>
                    <nav aria-label="Page navigation" class="pull-right">
                        <ul class="pagination">
                            <li><a href="/hrms/dept/getDeptList?pageNo=1">首页</a></li>
                            <c:if test="${curPageNo==1}">
                                <li class="disabled">
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPageNo!=1}">
                                <li>
                                    <a href="#" aria-label="Previous" class="prePage">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:forEach begin="1" end="${totalPages<5?totalPages:5}" step="1" var="itemPage">
                                <c:if test="${curPageNo == itemPage}">
                                    <li class="active"><a href="/hrms/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPageNo != itemPage}">
                                    <li><a href="/hrms/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                            </c:forEach>

                            <c:if test="${curPageNo==totalPages}">
                                <li class="disabled" class="nextPage">
                                    <a href="#" aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${curPageNo!=totalPages}">
                                <li>
                                    <a href="#" aria-label="Next" class="nextPage">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:if>
                            <li><a href="/hrms/dept/getDeptList?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.dept_info -->
    </div><!-- /.hrms_dept_body -->

    <%@ include file="departmentAdd.jsp"%>
    <%@ include file="departmentUpdate.jsp"%>

    <!-- 尾部-->
    <%@ include file="./commom/foot.jsp"%>

</div><!-- /.hrms_dept_container -->

<script type="text/javascript">
    var curPageNo = ${curPageNo};
    var totalPages = ${totalPages};
    //上一页
    $(".prePage").click(function () {
         if (curPageNo > 1){
             var pageNo = curPageNo - 1;
             $(this).attr("href", "/hrms/dept/getDeptList?pageNo="+pageNo);
         }
    });
    //下一页
    $(".nextPage").click(function () {
        if (curPageNo < totalPages){
            var pageNo = curPageNo + 1;
            $(this).attr("href", "/hrms/dept/getDeptList?pageNo="+pageNo);
        }
    });


    <!-- ==========================部门删除操作=================================== -->
    $(".dept_delete_btn").click(function () {
        var delDeptId = $(this).parent().parent().find("td:eq(0)").text();
        var delDeptName = $(this).parent().parent().find("td:eq(1)").text();
        var curPageNo = ${curPageNo};
        if (confirm("确认删除【"+ delDeptName +"】的信息吗？")){
            $.ajax({
                url:"${pageContext.request.contextPath}" + "/hrms/dept/delDept/"+delDeptId,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        alert("删除成功！");
                        window.location.href = "${pageContext.request.contextPath}" + "/hrms/dept/getDeptList?pageNo="+curPageNo;
                    }else {
                        alert(result.extendInfo.del_dept_error);
                    }
                }
            });
        }
    });
</script>
</body>
</html>
