<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/12/1
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css" media="all">

</head>
<script src="${pageContext.request.contextPath }/jquery-3.3.1.min.js"></script>
<script type="text/javascript" >
    $.ajax({
        type:'post',
        url:'${pageContext.request.contextPath }/deptquery.do',
        datatype: 'json',
        success:function (data) {
            var option="<option value=''>请选择</option>";
            if (null!=data){88
                for (var i=0;i<data.length;i++){
                    option+="<option value='"+data[i].deptno+"'>"+data[i].dname+"</option>"
                }
            }
            $("#dept").html(option);
        }
    })

</script>
<body>

<form class="layui-form" action="">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="tel" name="ename"  class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作</label>
            <div class="layui-input-inline">
                <input type="text" name="job"  class="layui-input">
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
    layui.use(['table','form','layer'],function () {
        var  table=layui.table,$=layui.jquery,form=layui.form,layer=layui.layer;
             table.render({
                elem:'#demo'
                 ,height:312
                 ,toolbar:'#toolbarDemo'
                 ,url: '/queyall.do' //数据接口
                 ,page:true
                 ,limit:5
                 ,cols: [[ //表头
                     {type: 'checkbox', fixed: 'left'}
                     ,{field: 'empno', title: 'ID', width:80, sort: true, fixed: 'left',type: 'numbers'}
                     ,{field: 'ename', title: '用户名', width:80,}
                     ,{field: 'job', title: '工作', width:80, sort: true}
                     ,{field: 'mgr', title: '经理', width:80}
                     ,{field: 'hiredate', title: '时间', width: 177}
                     ,{field: 'sal', title: '薪水', width: 80, sort: true}
                     ,{field: 'comm', title: '奖金', width: 80, sort: true}
                     ,{field: 'photo', title: '图片', width: 80}
                     ,{field: 'deptno', title: '部门', width: 135, sort: true}
                     ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                 ]]
             })


        //监听提交
        form.on('submit(demo1)',function (data) {
           // alert(111)
            table.reload('demo', {
                where: { //设定异步数据接口的额外参数，任意设
                    ename: data.field.ename
                    ,job: data.field.job
                    ,deptno:data.field.deptno
                    //…
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false;
        })

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
          var checkStaus=table.checkStatus(obj.config.id)
          var datas= checkStaus.data;
          if(datas.length!=0){
              var ids="";
              if (obj.event==='deleteall'){
                  layer.confirm('你真的要删除吗?', {icon: 3, title:'提示'}, function(index){
                      for (var i=0;i<datas.length;i++){
                          if(i<datas.length-1){
                              ids=ids+datas[i].empno+",";
                              //alert(ids);
                          }else {
                              ids=ids+datas[i].empno;
                          }
                      }
                      $.ajax({
                          type:'post',
                          url:'${pageContext.request.contextPath }/del.do?ids='+ids,
                          datatype:'json',
                          success:function (data) {
                              if (data==true){
                                  if(data){
                                      layer.msg("删除成功？",{icon: 5,})
                                      table.reload("demo")
                                  }else {
                                      layer.msg("删除失败？",{icon: 6,})
                                      table.reload("demo")
                                  }

                              }
                          }
                      })
                      layer.close(index);
                  });

              }
          }else if(obj.event==='addall'){
              //页面层
              layer.open({
                  type: 2,
                  area: ['700px', '480px'], //宽高
                  content: '/empjsp/lay-add.jsp'
              });
          }
          else {
              layer.msg("请选择一项！",{icon:1})
          }
        });

        //监听工具条
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        var data = obj.data; //获得当前行数据
        var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
        var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

        if(layEvent === 'detail'){ //查看
            //do somehing
        } else if(layEvent === 'del'){ //删除
            layer.confirm('真的删除行么', function(index){
                obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                layer.close(index);
                //向服务端发送删除指令
                var  id=data.empno;
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath }/del.do?ids='+id,
                    datatype:'json',
                    success:function (data) {
                        if (data==true){
                            if(data){
                                layer.msg("删除成功？",{icon: 5,})
                                table.reload("demo")
                            }else {
                                layer.msg("删除失败？",{icon: 6,})
                                table.reload("demo")
                            }

                        }
                    }
                })
            });
        } else if(layEvent === 'edit'){ //编辑
            var di=data.empno;
            //alert(di)
            layer.open({
                type: 2,
                area: ['700px', '480px'], //宽高
                content: '/empjsp/lay-updata.jsp?id='+di
            });
        } else if(layEvent === 'LAYTABLE_TIPS'){
            layer.alert('Hi，头部工具栏扩展的右侧图标。');
        }
        })
    })
</script>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="deleteall">批量删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="addall">添加</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

</body>
</html>
