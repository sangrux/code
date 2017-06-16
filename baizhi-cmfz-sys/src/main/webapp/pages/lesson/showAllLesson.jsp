<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg,$da;
    $(function () {
        $dg = $("#lessonDg");
        $da = $("#lessonDa");
        $dg.datagrid({
            url: '${pageContext.request.contextPath}/lesson/findAll',
            sortName:'id',
            remoteSort:false,
            fitColumns:true,
            method:'get',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "编号", field: "id", width: 200, align: 'center'},
                {title: "功课名称", field: "name", width: 200, align: 'center'},
                {title: "功课类型", field: "type", width: 200, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='look' onClick=\"look('" + row.id + "')\" href='javascript:;'>查看详情</a>"
                    }
                }
            ]],
            onLoadSuccess: function (data) {
                $(".look").linkbutton({
                    plain: true,
                    iconCls: 'icon-edit',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[1,2,3],
            toolbar:'#lessonTb',
        });
    });
    //查看详情
    function look(id){
        $da.dialog({
            width:600,
            height:400,
            title:"功课的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/lesson/lessonMsg.jsp?id='+id,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],
        });
    }

    //关闭对话框
    function closeDa(){
        $da.dialog('close',true);
    }
    //搜索的处理程序
    function search(value,name){
        console.log(value);
        console.log(name);
        $dg.datagrid('load',{
            name:value
        });
    }
</script>

<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',">
        <!--展示学生信息-->
        <table id="lessonDg" ></table>
        <div id="lessonDa"></div>
        <div id="lessonTb">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_excel',plain:true">导出Excel</a>
            <input id="ss" class="easyui-searchbox" style="width:200px"
                   data-options="searcher:search,prompt:'请输入....',menu:'#mm'"/>
            <div id="mm" style="width:120px">
                <div data-options="name:'name',iconCls:'icon-text_letter_omega'">编号</div>
                <div data-options="name:'age',iconCls:'icon-text_font_default'">姓名</div>
            </div>
        </div>

    </div>
</div>




