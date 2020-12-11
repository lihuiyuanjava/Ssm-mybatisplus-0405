<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/1
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">

</head>
<script src="${pageContext.request.contextPath }/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    $.ajax({
        type: 'post',
        url: '${pageContext.request.contextPath }/deptquery.do',
        datatype: 'json',
        success: function (data) {
            var option = "<option value=''>请选择</option>";
            if (null != data) {
                for (var i = 0; i < data.length; i++) {
                    option += "<option value='" + data[i].deptno + "'>" + data[i].dname + "</option>"
                }
            }
            $("#dept").html(option);
        }
    })

</script>
<body>

<form class="layui-form" action="" lay-filter="emp">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="ename" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作</label>
            <div class="layui-input-inline">
                <input type="text" name="job" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">薪水</label>
            <div class="layui-input-inline">
                <input type="text" name="sal" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">经理</label>
            <div class="layui-input-inline">
                <input type="text" name="mgr" class="layui-input">
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select id="dept" name="deptno">
                    <option>请选择</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="hiredate" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                </div>
            </div>
        </div>
        <div class="layui-inline">
            <div class="layui-input-block">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>
<table id="demo" lay-filter="test"></table>
<script src="/layui/layui.js"></script>
<script>
    layui.use(['table', 'form', 'layer', 'laydate'], function () {
        var table = layui.table, $ = layui.jquery, form = layui.form, layer = layui.layer, laydate = layui.laydate;

//常规用法
        laydate.render({
            elem: '#test1'
        });
        //监听提交
        form.on('submit(demo1)', function (data) {
            console.log(form.val('emp'));
            $.ajax({
                type: "post",
                contentType: 'application/json;charset=UTF-8',
                url: '${pageContext.request.contextPath }/save.do',
                data: JSON.stringify(form.val('emp')),
                datatype: 'json',
                success: function (data) {
                        if (data) {
                            layer.msg("添加成功", {icon: 6,})
                            table.reload("demo")
                        } else {
                            layer.msg("添加失败", {icon: 5,})
                        }
                    }


            })


        })


    })
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteall">批量删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="updateall">添加</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>


</body>
</html>
