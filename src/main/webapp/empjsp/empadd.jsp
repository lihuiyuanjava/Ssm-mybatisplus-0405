<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/4
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/insertall.do" enctype="multipart/form-data" method="post" >
        姓名：<input type="text" name="ename"><br>
        工作：<input type="text" name="job"><br>
        经理：<input type="text" name="mgr"><br>
        薪水：<input type="text" name="sal"><br>
        时间：<input type="date" name="hiredate">
        图片：<input type="file" name="pto">
        部门：<select name="deptno">
        <c:forEach var="bean" varStatus="sts" items="${bean}">
            <option value="${bean.deptno}">${bean.dname}</option>
            </c:forEach>
            </select>

       <input type="submit" value="添加">
</form>
</body>
</html>
