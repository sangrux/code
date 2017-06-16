<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<div style="text-align: center;margin-top: 60px">
    <form id="inputForm6" method="post" enctype="multipart/form-data">
        <div style="margin-top: 30px;">
            <input id="voiceIn" name="voiceName" style="width:180px">
        </div>
        <div style="margin-top:5px">
            音频时长:<input class="duration" style="width:200px" name="duration"/>
        </div>
        <div>
            请选择专辑名:<input id="dd" name="introduce.id">
        </div>
</div>
<script>

    $(function () {
        $('#voiceIn').filebox({
            buttonText: '选择音频文件',
            buttonAlign: 'right',
            accept:'.mp3',
        });
        $('#dd').combobox({
            url:'combobox_data.json',
            valueField:'id',
            textField:'title',
            url:'${pageContext.request.contextPath}/introduce/findAll'
        });
    });
</script>


