<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <img src="" id="ph11" style="width: 180px;height:180px"/><br/><br/>
    <form id="upload11" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa12()" value="提交">

    </form>
    <form id="inputForm1" method="post" >
        <div style="margin-top: 20px;">
            姓名:<input name="name" /><br/>
        </div>
        <div style="margin-top: 20px;">
            图片路径:<input id="photo11" name="photoPath" ><br/>
        </div>


        <div>


        </div>
    </form>
</div>
<script>
    function aa12(){
        $("#upload11").form('submit',{
            url:'${pageContext.request.contextPath}/guru/upload',
            success:function(data){
                $("#photo11").val(data);
                $("#ph11").attr('src',data);
            }
        })
    }
</script>




