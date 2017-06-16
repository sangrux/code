<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;margin-top: 60px">
    <img src="" id="ph4" style="width: 180px;height:180px"/><br/><br/>
    <form id="upload4" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa()" value="提交">
    </form>
    <form id="inputForm4" method="post" >

        法名:<input name="farmington" ><br/>
        密码：<input type="password" name="password"><br/>
        头像路径：<input id="photo4" name="photoPath"><br/>
        昵称：<input name="nickname"><br/>
        性别：<input type="radio" name="sex" value="男">男&nbsp;&nbsp;
        <input type="radio" name="sex" value="女">女<br/>
        省：<input name="province"><br/>
        市：<input name="city"><br/>
        所在地：<input name="location"><br/>
        个人签名：<input name="description"><br/>
        手机号：<input name="phone"><br/>
        上师：<input id="cc" class="easyui-combobox" name="guru.id" style="width:200px;">


    </form>
</div>
<script>
    function aa(){
        $("#upload4").form('submit',{
            url:'${pageContext.request.contextPath}/picture/upload',
            success:function(data){
                $("#photo4").val(data);
                $("#ph4").attr('src',data);
            }
        });



    }
    $(function () {
        $('#cc').combobox({
            valueField: 'id',
            textField: 'name',
            url: '${pageContext.request.contextPath}/guru/findAll',
        });
    })
</script>


