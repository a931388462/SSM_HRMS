<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>数据一览页面</title>
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
                            <c:choose>
                                <c:when test="${envMonData.temperature > 8 && envMonData.temperature < 15}">
                                    <td>${envMonData.temperature}</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="warning">${envMonData.temperature}</td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${envMonData.humidity > 45 && envMonData.humidity < 55}">
                                    <td>${envMonData.humidity}</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="warning">${envMonData.humidity}</td>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${envMonData.dustConcentration < 8.0}">
                                    <td>${envMonData.dustConcentration}</td>
                                </c:when>
                                <c:otherwise>
                                    <td class="warning">${envMonData.dustConcentration}</td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
