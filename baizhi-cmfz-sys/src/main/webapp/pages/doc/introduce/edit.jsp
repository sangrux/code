<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <form id="upload5" enctype="multipart/form-data" method="post">
        <input type="file" name="aaa" value="请选择文件">
        <input type="button" onclick="aa()" value="提交">
    </form>
    <form id="inputForm5" method="post" class="easyui-form">
        ID：<input type="text" name="id" readonly="readonly"><br/><br/>
        缩略图:<input id="photo5" name="photoPath" ><br/><br/>

        专辑名：<input type="text" name="title"><br/><br/>
        分数：<input type="text" name="score"><br/><br/>
        作者：<input type="text" name="author"><br/><br/>
        播音：<input type="text" name="broadcast"><br/><br/>
        集数：<input type="text" name="setCount"><br/><br/>
        内容简介：<input type="text" name="brief"><br/><br/>
        发布日期：<input class="easyui-datetimebox" name="createDate"
                    data-options="required:true,showSeconds:false" style="width:150px">

    </form>
</div>
<script>

    $(function(){
         $("#inputForm5").form('load','${pageContext.request.contextPath}/introduce/findOne?id=${param.id}');

    });


</script>

