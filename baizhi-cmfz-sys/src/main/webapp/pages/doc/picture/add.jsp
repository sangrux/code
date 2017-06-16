<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<div style="text-align: center;margin-top: 60px">

    <img src="" id="ph2" style="width: 180px;height:180px"/><br/><br/>
    <form id="upload23" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa()" value="提交">
    </form>
    <form id="inputForm2" method="post" >
        <div style="margin-top: 20px;">
            图片路径:<input id="photo23" name="picturePath" ><br/>
        </div>

        <div>
            图片描述：<input type="text" name="description">

        </div>
    </form>
</div>
<script>
    function aa(){
        $("#upload23").form('submit',{
            url:'${pageContext.request.contextPath}/picture/upload',
            success:function(data){
                $("#photo23").val(data)
                $("#ph23").attr('src',data);
            }
        })
    }
</script>


