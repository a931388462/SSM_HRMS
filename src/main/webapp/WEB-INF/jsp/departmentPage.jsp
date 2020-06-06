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
                            <select id="monitoringTime" class="form-control">
                                <c:forEach items="${monitoringTimeStrList}" var="monitoringTimeStr">
                                    <c:choose>
                                        <c:when test="${selMonitoringTimeStr eq monitoringTimeStr}">
                                            <option value="${monitoringTimeStr}" selected = "selected" >${monitoringTimeStr}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${monitoringTimeStr}">${monitoringTimeStr}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                    </div>
                            <div class="form-group">
                                <select id="deviceName" class="form-control">
                                    <c:forEach items="${deviceNameList}" var="deviceName">
                                        <c:choose>
                                            <c:when test="${selDeviceName eq deviceName}">
                                                <option value="${deviceName}" selected = "selected" >${deviceName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${deviceName}">${deviceName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
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
                    <c:forEach items="${allEnvMonDatas}" var="envMonData">
                        <tr>
                            <td>${envMonData.deviceName}</td>
                            <td>${envMonData.monitoringTimeStr}</td>
                            <td>${envMonData.temperature}</td>
                            <td>${envMonData.humidity}</td>
                            <td>${envMonData.dustConcentration}</td>
                        </tr>
                    </c:forEach>
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
    <!-- 尾部-->
    <%@ include file="./commom/foot.jsp"%>

</div><!-- /.hrms_dept_container -->

<script type="text/javascript">
    //根据设备名检索
    $("#deviceName").change(function(){
        var deviceName = $('#deviceName').val();
        var monitoringTime = $('#monitoringTime').val();
        window.location.href= "${pageContext.request.contextPath}"+"/hrms/getEnvironmentalMonitoring?deviceName=" + deviceName +"&monitoringTime=" + monitoringTime;
    });
    //根据设备名检索
    $("#monitoringTime").change(function(){
        var deviceName = $('#deviceName').val();
        var monitoringTime = $('#monitoringTime').val();
        window.location.href= "${pageContext.request.contextPath}"+"/hrms/getEnvironmentalMonitoring?deviceName=" + deviceName +"&monitoringTimeStr=" + monitoringTime;
    });


</script>
</body>
</html>
