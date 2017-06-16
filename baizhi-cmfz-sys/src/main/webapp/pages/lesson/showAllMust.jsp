<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg8,$da8;
    $(function () {
        $dg8 = $("#counterDg8");
        $da8 = $("#counterDa8");
        $dg8.datagrid({
            url: '${pageContext.request.contextPath}/lesson/findAllMust',
            sortName:'id',
            remoteSort:false,
            fitColumns:true,
            method:'get',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "编号", field: "id", width: 220, align: 'center'},
                {title: "名称", field: "name", width: 220, align: 'center'},
                {title: "类型", field: "type", width: 220, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del2' onClick=\"del('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;";

                    }
                }
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
    //删除的操作
    function del(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.post('${pageContext.request.contextPath}/lesson/delete',{"id":id});
                $dg8.datagrid('reload');
            }
        });
    }


    //搜索的处理程序
    function search(value,name){
        console.log(value);
        console.log(name);
        $dg8.datagrid('load',{
            name:value
        });
    }

    //保存图片
    function savePic(){
        $("#inputForm8").form('submit',{
            url:'${pageContext.request.contextPath}/lesson/add',
            success:function(){
                $("#a8").dialog('close',true);
                $dg8.datagrid('reload');
                $.messager.show({
                    title:'我的消息',
                    msg:'添加成功',
                    timeout:5000,
                    showType:'slide'
                });

            }
        });
    }

    //关闭对话框
    function closeDa(){
        $da8.dialog('close',true);
    }


    //添加操作
    function add(){
        $('#a8').dialog({
            title: '添加',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/lesson/add.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:savePic
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

        $('#a8').dialog('refresh');


    }
</script>

<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',">
        <!--展示学生信息-->
        <table id="counterDg8" ></table>
        <div id="counterDa8"></div>
        <div id="counterTb8">
            <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_excel',plain:true">导出Excel</a>
            <input id="ss1" class="easyui-searchbox" style="width:200px"
                   data-options="searcher:search,prompt:'请输入....',menu:'#mm1'"/>
            <div id="mm1" style="width:120px">
                <div data-options="name:'name',iconCls:'icon-text_letter_omega'">编号</div>
                <div data-options="name:'age',iconCls:'icon-text_font_default'">名称</div>
            </div>
        </div>
        <div id="a8"></div>
    </div>
</div>




