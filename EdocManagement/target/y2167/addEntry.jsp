<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/24
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        function Entry() {
            //获取数据
            var title=$("[name=title]").val();
            var summary=$("[name=summary]").val();
            var categoryId=$("[name=categoryId]").val();
            var uploaduser=$("[name=uploaduser]").val();
            var createdate=$("[name=createdate]").val();

            if(title==null||title==""){
                alert("请输入文档名称")
                return
            }
            if(createdate==null||createdate==""){
                alert("请输入时间")
                return;
            }
            var a = /^(\d{4})-(\d{2})-(\d{2})$/
            if (!a.test(createdate)) {
                alert("日期格式不正确!")
                return false;
            }

            location.href="${pageContext.request.contextPath}/addEntry?title="+title+"&summary="+summary+"&categoryId="+categoryId+"&uploaduser="+uploaduser+"&createdate="+createdate;

        }



        //修改
        function updateEntry() {
            //获取数据
            var id=$("[name=id]").val();
            var title=$("[name=title]").val();
            var summary=$("[name=summary]").val();
            var categoryId=$("[name=categoryId]").val();
            var uploaduser=$("[name=uploaduser]").val();
            var createdate=$("[name=createdate]").val();

            if(title==null||title==""){
                alert("请输入文档名称")
                return
            }
            if(createdate==null||createdate==""){
                alert("请输入时间")
                return;
            }
            var a = /^(\d{4})-(\d{2})-(\d{2})$/
            if (!a.test(createdate)) {
                alert("日期格式不正确!")
                return false;
            }

            location.href="${pageContext.request.contextPath}/updateEntry?id="+id+"&title="+title+"&summary="+summary+"&categoryId="+categoryId+"&uploaduser="+uploaduser+"&createdate="+createdate;
        }

    </script>


</head>
<body>
    <div align="center">
        <table border="2px" width="500px">
            <tr bgcolor="#7fffd4">
                <c:if test="${update!=null}">
                    <td colspan="6" align="center" > <h1>更新电子文档</h1></td>
                </c:if>
                <c:if test="${update==null}">
                    <td colspan="6" align="center" > <h1>增加电子文档</h1></td>
                </c:if>
            </tr>
            <c:if test="${update!=null}">
                <tr>
                    <td>文档编号</td><td><input name="id" value="${update.id}" readonly="readonly"></td>
                </tr>
            </c:if>


            <tr>
                <td>文档名称<font color="red">（*）</font></td>
                <td colspan="5"><input name="title" value="${update.title}"></td>
            </tr>
            <tr>
                <td>文档摘要</td>
                <td colspan="5"><textarea rows="4" cols="40" name="summary" >${update.summary}</textarea></td>
            </tr>
            <tr>
                <td>文档类型</td>
                <td colspan="5">
                    <select name="categoryId">
                        <c:forEach items="${category}" var="item">
                            <option value="${item.id}" <c:if test="${item.id == update.categoryId}">selected="selected"</c:if>>${item.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>上传人</td>
                <td colspan="5"><input name="uploaduser" value="${update.uploaduser}"></td>
            </tr>
            <tr>
                <td>上传时间<font color="red">（*）</font></td>
                <td colspan="5"><input name="createdate" value="${update.createdate}">(yyyy-MM-dd)</td>
            </tr>
            <tr>
                <c:if test="${update==null}">
                    <td colspan="6" align="center">
                        <button onclick="javascript:Entry()">提交</button>&nbsp;&nbsp;<button>返回</button>
                    </td>
                </c:if>

                <c:if test="${update!=null}">
                    <td colspan="6" align="center">
                        <button onclick="updateEntry()">提交</button>&nbsp;&nbsp;<button>返回</button>
                    </td>
                </c:if>

            </tr>
        </table>
    </div>
</body>
</html>
