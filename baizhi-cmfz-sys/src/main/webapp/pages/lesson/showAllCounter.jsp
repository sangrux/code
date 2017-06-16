<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg8,$da8;
    $(function () {
        $dg8 = $("#counterDg8");
        $da8 = $("#counterDa8");
        $dg8.datagrid({
            url: '${pageContext.request.contextPath}/counter/findAll',
            sortName:'id',
            remoteSort:false,
            fitColumns:true,
            method:'get',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "编号", field: "id", width: 220, align: 'center'},
                {title: "名称", field: "name", width: 220, align: 'center'},
                {title: "计数", field: "count", width: 220, align: 'center'},
                {title: "创建时间", field: "createTime", width: 220, align: 'center'},
            ]],
            onLoadSuccess: function (data) {
                console.log(data);

                $(".del").linkbutton({
                    plain: true,
                    iconCls: 'icon-remove',
                });
                $(".edit").linkbutton({
                    plain: true,
                    iconCls: 'icon-edit',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[1,2,3],
            toolbar:'#counterTb8',
        });
    });

    //搜索的处理程序
    function search(value,name){
        console.log(value);
        console.log(name);
        $dg8.datagrid('load',{
            name:value
        });
    }
</script>

<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',">
        <!--展示学生信息-->
        <table id="counterDg8" ></table>
        <div id="counterDa8"></div>
        <div id="counterTb8">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_excel',plain:true">导出Excel</a>
            <input id="ss1" class="easyui-searchbox" style="width:200px"
                   data-options="searcher:search,prompt:'请输入....',menu:'#mm1'"/>
            <div id="mm1" style="width:120px">
                <div data-options="name:'name',iconCls:'icon-text_letter_omega'">编号</div>
                <div data-options="name:'age',iconCls:'icon-text_font_default'">名称</div>
            </div>
        </div>

    </div>
</div>




