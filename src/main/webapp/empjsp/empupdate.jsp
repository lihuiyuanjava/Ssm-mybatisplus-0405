<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/11/5
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath }/jquery-3.3.1.min.js"></script>
<script type="text/javascript" >
    $(function () {
        alert(111);
        var deptno=$("#deptno").val();
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath }/querydept.do',
            datatype:'json',
            success:function (data) {
                alert(data);
                var option="";
                if (null!=data){
                    for (var i=0;i<data.length;i++){
                        option+="<option value='"+data[i].deptno+"'"+(data[i].deptno==deptno?'selected':'')+">"+data[i].dname+"</option>"
                    }
                }
                $("#dept").html(option);

            }

        })



    })

</script>
<body>
<form action="/update.do" method="post">
    <input type="hidden" name="empno" value="${bean.empno}">
    姓名：<input type="text" name="ename" value="${bean.ename}"><br>
    工作：<input type="text" name="job"   value="${bean.job}"><br>
    经理：<input type="text" name="mgr"   value="${bean.mgr}"><br>
    薪水：<input type="text" name="sal"   value="${bean.sal}"><br>
    部门：<select name="deptno" id="dept" >
    <%--<c:forEach var="list" varStatus="sts" items="${List}">--%>
        <option value="${bean.deptno}" id="deptno">请选择</option>
      <%--  <option value="${role.rid}" ${role.rid==ulist.rid?'selected':''}>${role.role}</option>--%>
   <%-- </c:forEach>--%>
</select>

    <input type="submit" value="修改">
</form>
</body>
</html>
