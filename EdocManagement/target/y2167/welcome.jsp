<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    function addEntry() {
        location.href="${pageContext.request.contextPath}/showAddEntry";
    }


    //删除
    function delEntry(id) {
        $.ajax({
            url:"${pageContext.request.contextPath}/delEntry",
            method:"POST",
            data:{"id":id},
            success:function (data) {
                selectId();
                $("#showtable").after("<tr><td colspan='6' align='center'>"+
                    "<font color='red'>删除成功</font>"+
                    "</td>"+
                    "</tr>");
            }
        })
    }

    function selectId() {
        //获取选中的id
        var categoryid=$("[name=categoryid]").val();
        var title="<tr  >"+
            "<td rowspan='1' colspan='6' align='center'>"+
        "<h1>电子文档列表</h1>"+
        "</td>"+
        "</tr>"+
        "<tr style='color: darkolivegreen'>"+
        "<td>文档编号</td>"+
        "<td>文档名称</td>"+
        "<td>文档摘要</td>"+
            "<td>上传人</td>"+
            "<td>上传时间</td>"+
            "<td>操作</td>"+
            "</tr>";

        var content=[];

        $.ajax({
            url:"${pageContext.request.contextPath}/categoryById",
            type:"POST",
            data:{"categoryid":categoryid},
            success:function (data) {
                $("#showtable").html('');
                content[0]=title;
                $.each(data,function (i,dom) {
                    content[i+1]="<tr class='tdcolor'><td>"+dom.id+"</td>"+
                        "<td>"+dom.title+"</td>"+
                        "<td>"+dom.summary+"</td>"+
                        "<td>"+dom.uploaduser+"</td>"+
                        "<td>"+dom.createdate+"</td>"+
                        "<td><a href='${pageContext.request.contextPath}/showAddEntry?id="+dom.id+"'>修改</a><a onclick='delEntry("+dom.id+")'>删除</a></td><tr/>";
                });
                $("#showtable").html(content);
            }

        })


    }
    $(function () {
        $(".tdcolor:even").css("backgroundColor","#00FFFF");
    })

</script>


<body>
    <div align="center">
        文档分类：<select name="categoryid">
                    <option value="0">全部</option>
                    <c:forEach items="${category}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                  </select>
        <button onclick="selectId()">查询</button>&nbsp;&nbsp;&nbsp;&nbsp;
        <button onclick="addEntry()">新增电子文档</button><br>
        <table border="2px" id="showtable">
            <tr>
                <td rowspan="1" colspan="6" align="center">
                    <h1>电子文档列表</h1>
                </td>
            </tr>
            <tr style="color: darkolivegreen">
                <th>文档编号</th>
                <th>文档名称</th>
                <th>文档摘要</th>
                <th>上传人</th>
                <th>上传时间</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${entry}" var="item">
                <tr class="tdcolor">
                    <td>${item.id}</td>
                    <td>${item.title}</td>
                    <td>${item.summary}</td>
                    <td>${item.uploaduser}</td>
                    <td>${item.createdate}</td>
                    <td><a href="${pageContext.request.contextPath}/showAddEntry?id=${item.id}">修改</a><a onclick="delEntry(${item.id})">删除</a></td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>


</html>
