<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">

    <form id="upload1" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa1()" value="提交">
    </form>
    <form id="inputForm1" method="post" class="easyui-form">
        <div style="margin-top:20px;">
            ID:<input name="id" readonly="readonly" class="easyui-textbox" data-options="required:true,iconCls:'icon-man'"/><br/>
        </div>
        <div style="margin-top: 20px;">
            姓名:<input name="name" class="easyui-textbox" data-options="required:true,iconCls:'icon-picture_edit'"/><br/>
        </div>
        <div style="margin-top: 20px;">
            图片路径:<input onclick="bvc1()" name="photoPath" id="photo1" type="text" class="easyui-datebox" data-options="required:true;iconCls:'icon-date_edit'"/><br/>

        </div>
        <div id="asd" >
            <%--<a href='"+row.photoPath+"' target='_blank'><img src='"+row.photoPath+"' width='20px' height='20px'></a>";--%>
        </div>
    </form>
</div>
<script>

    $(function(){
         $("#inputForm1").form('load','${pageContext.request.contextPath}/guru/findOne?id=${param.id}');

    });
    function bvc1() {
        var old=$("#photo1").val();
        alert(old);
        $("<img src='"+old+"' />").appendTo("#asd");
    }
    function aa1(){
        $("#upload1").form('submit',{
            url:'${pageContext.request.contextPath}/guru/upload',
            success:function(data){
                $("#photo1").val(data)
            }
        })
    }

</script>

