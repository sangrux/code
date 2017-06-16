<%--
  Created by IntelliJ IDEA.
  User: acer1
  Date: 2017/6/12
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;margin-top: 30px">
       <form id="lessonMsgForm" method="post">
    </form>
</div>
<script>

    $(function(){
        //构建子页面元素的操作
        console.log("${param.id}");
        //$("#guruForm").form('load','${pageContext.request.contextPath}/lesson/queryById?id='+"${param.id}");

        $.post("${pageContext.request.contextPath}/lesson/queryById?id=${param.id}",function(data){
                console.log(data);
                var content="<span>用户法名</span>&nbsp;&nbsp;&nbsp;"+data.user.nickname+"<br/><br/><span>计时器</span><br/>";
                $.each(data.counters,function(i,counter){
                    content += "<span>计时器名："+counter.name+"&nbsp;数量："+counter.count+"&nbsp;添加时间："+counter.createTime+"</span><br/>"
                });
                $("#lessonMsgForm").append(content);

        },"JSON");



    });

</script>
