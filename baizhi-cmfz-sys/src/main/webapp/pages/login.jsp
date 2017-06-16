<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/11
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/easyui-lang-zh_CN.js"></script>


</head>
<body >
<form method="post" action="${pageContext.request.contextPath}/admin/login">
    <div align="center" style="margin: 10px 10px 10px 10px"><font size="5px">管理员登录</font>
        ${param.msg};
        <div align="center" style="margin: 10px 10px 10px 10px">
            用户名：<input class="easyui-textbox" data-options="iconCls:'icon-man';missingMessage:'请输入用户名：'" style="width:180px" type="text" name="name" ><br/><br/>
            密&nbsp;码：<input class="easyui-passwordbox"  style="width:180px" type="text" name="password" data-options="missingMessage:'请输入密码：';"><br/><br/>
            <%--验证码：<input class="easyui-textbox" type="text" name="code" style="width:80px"/>
            <img src=""/><br/><br/>--%>
            <input class="easyui-linkbutton" data-options="plain:true" type="submit" value="登陆">
        </div>
    </div>
</form>

</body>
</html>
