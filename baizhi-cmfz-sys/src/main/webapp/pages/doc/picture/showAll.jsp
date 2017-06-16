<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg2,$da2;
    $(function () {
        $dg2 = $("#stuDg2");
        $da2 = $("#a2");
        $dg2.datagrid({
            url: '${pageContext.request.contextPath}/picture/findAll',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "ID", field: "id", width: 200, align: 'center'},
                {title: "图片路径", field: "picturePath", width: 200, align: 'center',
                    formatter:function(value,row,index){
                        return "<a href='"+row.picturePath+"' target='_blank'>"+row.picturePath+"</a>";;
                    }
                },
                {title: "创建日期", field: "createDate", width: 200, align: 'center'},
                {title: "图片描述", field: "description", width: 200, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del2' onClick=\"del('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;" +
                                "<a class='edit2' onClick=\"editRow('" + row.id + "')\"  href='javascript:;'>修改</a>";

                    }
                }
            ]],
            onLoadSuccess: function (data) {
                $(".del2").linkbutton({
                    plain: true,
                    iconCls: 'icon-remove',

                });
                $(".edit2").linkbutton({
                    plain: true,
                    iconCls: 'icon-edit',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[2,4,6,8,10],
            toolbar:'#tb2',

        });
    });

    //删除的操作
    function del(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.post('${pageContext.request.contextPath}/picture/drop',{"id":id});
                $dg2.datagrid('reload');
            }
        });
    }


    //修改的操作
    function editRow(id){
        $da2.dialog({
            width:600,
            height:300,
            title:"图片的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/doc/picture/edit.jsp?id='+id,
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:changePic,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

    }



    //修改信息
    function changePic(){
        $("#inputForm2").form('submit',{
            url:'${pageContext.request.contextPath}/picture/update',
            success:function(){
                $da2.dialog('close',true);
                $dg2.datagrid('reload');
            }
        });
    }

    //保存图片
    function savePic(){
        $("#inputForm2").form('submit',{
            url:'${pageContext.request.contextPath}/picture/add',
            success:function(){
                $("#a2").dialog('close',true);
                $dg2.datagrid('reload');
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
        $da2.dialog('close',true);
    }


    //添加操作
    function add(){
        $('#a2').dialog({
            title: '添加',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/doc/picture/add.jsp',
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

        $('#a2').dialog('refresh');


    }
</script>


    <div  class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',">
            <table id="stuDg2" ></table>

            <div id="tb2">
                <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>

            </div>
            <div id="a2"></div>

        </div>
    </div>




