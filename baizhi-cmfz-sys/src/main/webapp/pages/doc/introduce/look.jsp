<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg66,$da66;
    $(function () {
        $dg66= $("#stuDg66");
        $da66 = $("#a66");
        $dg66.datagrid({
            url: '${pageContext.request.contextPath}/voice/findAllByIntroduceId?id=${param.id}',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "ID", field: "id", width: 200, align: 'center'},
                {title: "文件名称", field: "title", width: 200, align: 'center',

                },
                {title: "下载地址", field: "downloadUrl", width: 200, align: 'center',
                    formatter:function(value,row,index){
                        return "<a href='"+row.downloadUrl+"' target='_blank'>"+row.downloadUrl+"</a>";;
                    }
                },
                {title: "音频大小", field: "size", width: 200, align: 'center'},
                {title: "音频时长", field: "duration", width: 200, align: 'center'},
            ]],
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[2,4,6,8,10],
            toolbar:'#tb2',

        });
    });




</script>


    <div  class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',">
            <table id="stuDg66" ></table>

            <div id="tb66">
                <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>

            </div>

        </div>
    </div>




