<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg3,$da3;
    $(function(){
        $dg3 = $("#adminDg3");
        $da3 = $("#adminDa3");
        $dg3.datagrid({
            url: '${pageContext.request.contextPath}/admin/findAll',
            sortName:'id',
            remoteSort:false,
            pagination:true,
            fitColumns:true,
            method:'get',
            //fit:true,
            width:'100%',
            height:'100%',
            columns: [[
                {title: "编号", field: "id", width: 200, align: 'center'},
                {title: "姓名", field: "name", width: 200, align: 'center'},
                {title: "密码", field: "password", width: 200, align: 'center'},
                {title: "级别", field: "type", width: 200, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del' onClick=\"del('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;" +
                                "<a class='edit' onClick=\"editRow('" + row.id + "')\"  href='javascript:;'>修改</a>";
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
            pageSize:6,
            pageList:[10,6,2],
            toolbar:'#adminTb3',
        });
    });

    //删除的操作
    function del(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.get('${pageContext.request.contextPath}/admin/delete',{"id":id},function () {
                    $dg3.datagrid('reload');
                })
            }

        });
    }
    //修改的操作
    function editRow(id){
        $da3.dialog({
            width:600,
            height:300,
            title:"用户的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/sys/admin/edit.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:changeStu,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });
    }
    //添加信息
    function addRow(){
        $da3.dialog({
            width:600,
            height:300,
            title:"用户的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/sys/admin/add.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:saveStu,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

    }

    //保存用户
    function saveStu(){
        $("#inputForm3").form('submit',{
            url:'${pageContext.request.contextPath}/admin/add',
            success:function(){
                $da3.dialog('close',true);
                $dg3.datagrid('reload');
            }
        });
    }
    //修改信息
    function changeStu(){
        $("#inputForm3").form('submit',{
            url:'${pageContext.request.contextPath}/admin/update',
            success:function(){
                $da3.dialog('close',true);
                $dg3.datagrid('reload');
            }
        });
    }
    //关闭对话框
    function closeDa(){
        $da3.dialog('close',true);
    }
    //搜索的处理程序
    function search(value,name){
        console.log(value);
        console.log(name);
        $dg3.datagrid('load',{
            name:value
        });
    }

</script>

<div  class="easyui-layout" data-options="fit:true">
    <div data-options="region:'center',">
        <!--管理员信息-->
        <table id="adminDg3" ></table>
        <div id="adminDa3"></div>
        <div id="adminTb3">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:addRow">添加</a>

        </div>

    </div>
</div>




