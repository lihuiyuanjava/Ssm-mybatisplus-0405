<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/4
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    function allchecked() {
        alert(${pageContext.request.contextPath})
        var checked = document.getElementsByName("ids")
        for (var i = 0; i < checked.length; i++) {
            checked[i].checked = !checked[i].checked;
        }
    }

</script>
<body>
<a href="/querydeptin.do" methods="post">添加</a>
<form action="/deleteall.do">
    <input type="submit" value="批量删除">
    <table border="1">
        <tr>
            <td><input type="checkbox" onclick="allchecked()"></td>
            <td>编号</td>
            <td>名字</td>
            <td>工作</td>
            <td>经理</td>
            <td>时间</td>
            <td>薪水</td>
            <td>图片</td>
            <td>部门</td>
        </tr>
        <c:forEach var="list" varStatus="stu" items="${list}">
            <tr>
                <td><input type="checkbox" name="ids" value="${list.empno}"></td>
                <td>${stu.index+1}</td>
                <td>${list.ename}</td>
                <td>${list.job}</td>
                <td>${list.mgr}</td>
                <td>${list.hiredate}</td>
                <td>${list.sal}</td>
                <td><img src="/upload/${list.photo}" style="height: 50px;width: 50px"></td>
                <td>${list.dept.dname}</td>
                <td><a href="/seleteone.do?id=${list.empno}">修改</a></td>
                <td><a href="/deleteone.do?id=${list.empno}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <div id="page"></div>
</form>
<script src="${pageContext.request.contextPath}/jquery-3.3.1.min.js"></script>
<script>
    window.onload = function () {

        var page = 1;

        function handle(text) {
            page = text;
            console.log(page)
        }


        var li = function (value) {
            console.log(value)
            return "<li onclick=handle(this.text)>" + value + "</li>";
        }
        var html = '<ul>';

        for (var i = 1; i < 10; i++) {
            html += li(i);
        }
        html += "</ul>"
        $('#page').html(html);

        $('#page>ul>li').css({
            listStyle: 'none',
            float: 'left',
            width: '5px',
            height: '5px',
            marginLeft: '10px',
            cursor: 'pointer'
        });
    }

</script>
</body>
</html>
