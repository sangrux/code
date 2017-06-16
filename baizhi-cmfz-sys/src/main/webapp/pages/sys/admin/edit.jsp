<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <form id="inputForm3" method="post" class="easyui-form">
        <div style="margin-top:20px;">
            ID:<input name="id" readonly="readonly" class="easyui-textbox" data-options="required:true,iconCls:'icon-man';re"/><br/>
        </div>
        <div style="margin-top: 20px;">
            姓名:<input name="name" id="photo3" class="easyui-textbox" data-options="required:true,iconCls:'icon-picture_edit'"/><br/>
        </div>
        <div style="margin-top: 20px;">
            密码:<input name="password" type="text" class="easyui-datebox" data-options="required:true;iconCls:'icon-date_edit'"/><br/>
        </div>
        <div>
            type：<select name="type">
                    <option name="root">超级管理员</option>
                    <option name="normal">普通管理员</option>
                 </select>

        </div>
    </form>
</div>
<script>

    $(function(){
         $("#inputForm3").form('load','${pageContext.request.contextPath}/admin/findOne?id=${param.id}');

    });

    function aa(){
        $("#upload3").form('submit',{
            url:'${pageContext.request.contextPath}/picture/add',
            success:function(data){
                $("#photo3").val(data)
            }
        })
    }

</script>

