<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <form id="inputForm3" method="post" action="${pageContext.request.contextPath}/admin/add">
        <div style="margin-top: 20px;">
            姓名:<input name="name" /><br/>
        </div>
        <div style="margin-top: 20px;">
            密码:<input id="password" name="password" ><br/>
        </div>

        <div style="margin-top: 20px;">
            级别：<select name="type">
                    <option name="root">超级管理员</option>
                    <option name="normal">普通管理员</option>
                </select>
        </div>
    </form>
</div>




