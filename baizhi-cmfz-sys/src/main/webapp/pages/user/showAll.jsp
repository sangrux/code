<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg4,$da4;
    $(function () {
        $dg4 = $("#stuDg4");
        $da4 = $("#a4");
        $dg4.datagrid({
            url: '${pageContext.request.contextPath}/user/findAll',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "ID", field: "id", width: 200, align: 'center'},
                {title: "法名", field: "farmington", width: 200, align: 'center'},
                {title: "头像路径", field: "photoPath", width: 200, align: 'center'},
                {title: "昵称", field: "nickname", width: 200, align: 'center'},
                {title: "性别", field: "sex", width: 200, align: 'center'},
                {title: "省", field: "province", width: 200, align: 'center'},
                {title: "市", field: "city", width: 200, align: 'center'},
                {title: "所在地", field: "location", width: 200, align: 'center'},
                {title: "个人签名", field: "description", width: 200, align: 'center'},
                {title: "手机号", field: "phone", width: 200, align: 'center'},
                {title: "上师", field: "guru.name", width: 200, align: 'center',
                    formatter: function (value, row, index) {
                        return row.guru.name;
                    }
                },
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del' onClick=\"del('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;" +
                                "<a class='edit' onClick=\"editRow('" + row.id + "')\"  href='javascript:;'>修改</a>";
                    }
                }
            ]],
            onLoadSuccess: function (data) {
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
            pageList:[2,4,6,8,10],
            toolbar:'#tb4',

        });
    });

    //删除的操作
    function del(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.post('${pageContext.request.contextPath}/user/delete',{"id":id});
                $dg4.datagrid('reload');
            }
        });
    }


    //修改的操作
    function editRow(id){
        $da4.dialog({
            width:600,
            height:300,
            title:"图片的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/user/edit.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:changeUse,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

    }



    //修改信息
    function changeUse(){
        $("#inputForm4").form('submit',{
            url:'${pageContext.request.contextPath}/user/update',
            success:function(){
                $da4.dialog('close',true);
                $dg4.datagrid('reload');
            }
        });
    }

    //保存图片
    function saveUse(){
        $("#inputForm4").form('submit',{
            url:'${pageContext.request.contextPath}/user/add',
            success:function(){
                $("#a4").dialog('close',true);
                $dg4.datagrid('reload');

            }
        });
    }

    //关闭对话框
    function closeDa(){
        $da4.dialog('close',true);
    }


    //添加操作
    function add(){
        $('#a4').dialog({
            title: '添加',
            width: 400,
            height: 500,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/user/add.jsp',
            modal: true,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:saveUse,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

        //$('#a4').dialog('refresh');


    }
</script>


    <div  class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',">
            <table id="stuDg4" ></table>

            <div id="tb4">
                <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
                <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-page_excel',plain:true">导出Excel</a>

            </div>


            <div id="a4"></div>

        </div>
    </div>




