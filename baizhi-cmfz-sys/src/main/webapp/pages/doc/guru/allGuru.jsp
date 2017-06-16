<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg1,$da1;
    $(function () {
        $dg1 = $("#stuDg1");
        $da1 = $("#a1");
        $dg1.datagrid({
            url: '${pageContext.request.contextPath}/guru/findAll',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "ID", field: "id", width: 200, align: 'center'},
                {title: "姓名", field: "name", width: 200, align: 'center'},
                {title: "图片路径", field: "photoPath", width: 200, align: 'center',
                    formatter:function(value,row,index){
                        return "<a href='"+row.photoPath+"' target='_blank'>"+"<img src='"+row.photoPath+"' width='20px' height='20px'>"+"</a>";
                    }
                },
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del1' onClick=\"dels('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;" +
                                "<a class='edit1' onClick=\"editRow1('" + row.id + "')\"  href='javascript:;'>修改</a>";
                    }
                }
            ]],
            onLoadSuccess: function (data) {
                $(".del1").linkbutton({
                    plain: true,
                    iconCls: 'icon-remove',

                });
                $(".edit1").linkbutton({
                    plain: true,
                    iconCls: 'icon-edit',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[2,4,6,8,10],
            toolbar:'#tb1',

        });
    });

    //删除的操作
    function dels(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.post('${pageContext.request.contextPath}/guru/drop',{"id":id});
                $dg1.datagrid('reload');
            }
        });
    }


    //修改的操作
    function editRow1(id){
        $da1.dialog({
            width:600,
            height:300,
            title:"图片的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/doc/guru/edit.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:saveUpdate1,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa1,
            }],

        });

    }


    //保存修改
    function saveUpdate1(){
        $("#inputForm1").form('submit',{
            url:'${pageContext.request.contextPath}/guru/update',
            success:function(){
                $("#a1").dialog('close',true);
                $dg1.datagrid('reload');

            }
        });
    }

    //保存图片
    function savePic(){
        $("#inputForm1").form('submit',{
            url:'${pageContext.request.contextPath}/guru/add',
            success:function(){
                $("#a1").dialog('close',true);
                $dg1.datagrid('reload');

            }
        });
    }

    //关闭对话框
    function closeDa1(){
        $da1.dialog('close',true);
    }


    //添加操作
    function add1(){
        $('#a1').dialog({
            title: '添加',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/doc/guru/add.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:savePic
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa1,
            }],

        });

        $('#a1').dialog('refresh');


    }
</script>


<div  class="easyui-layout" data-options="fit:true">

    <div data-options="region:'center',">
        <table id="stuDg1" ></table>

        <div id="tb1">
            <a href="#" onClick="add1()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>

        </div>
        <div id="a1"></div>

    </div>
</div>




