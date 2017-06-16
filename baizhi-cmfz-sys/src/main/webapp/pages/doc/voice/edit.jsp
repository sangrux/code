<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <form id="upload2" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa()" value="提交">
    </form>
    <form id="inputForm2" method="post" class="easyui-form">
        <div style="margin-top:20px;">
            ID:<input name="id" readonly="readonly" class="easyui-textbox" data-options="required:true,iconCls:'icon-man'"/><br/>
        </div>
        <div style="margin-top: 20px;">
            图片路径:<input name="picturePath" id="photo2"/><br/>
        </div>
        <div style="margin-top: 20px;">
            创建日期:<input name="createDate" readonly="readonly" type="text" class="easyui-datebox" data-options="required:true;iconCls:'icon-date_edit'"/><br/>
        </div>
        <div>
            图片描述：<input name="description">

        </div>

    </form>
</div>
<script>

    $(function(){
         $("#inputForm2").form('load','${pageContext.request.contextPath}/picture/findOne?id=${param.id}');

    });

    function aa(){
        $("#upload2").form('submit',{
            url:'${pageContext.request.contextPath}/picture/upload',
            success:function(data){
                $("#photo2").val(data)
            }
        })
    }

</script>

