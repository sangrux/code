<%--
  Created by IntelliJ IDEA.
  User: acer1
  Date: 2017/6/15
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $.post("${pageContext.request.contextPath}/article/queryById?id=${param.id}",function(data){
                $("#articlePage").append(data.content);
            },"JSON");
        });
    </script>
</head>
<body>
<div style="text-align: center;" id="articlePage">
</div>
</body>
</html>
