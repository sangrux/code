<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg6,$da6;
    $(function () {
        $dg6 = $("#stuDg6");
        $da6 = $("#a6");
        $dg6.datagrid({
            url: '${pageContext.request.contextPath}/voice/findAll',
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
                {title: "专辑名", field: "introduce", width: 200, align: 'center',
                    formatter:function(value,row,index){
                        return row.introduce.title;
                    }
                },
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
                $.post('${pageContext.request.contextPath}/voice/drop',{"id":id});
                $dg6.datagrid('reload');
            }
        });
    }


    //修改的操作
    function editRow(id){
        $da6.dialog({
            width:600,
            height:300,
            title:"图片的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/doc/voice/edit.jsp?id='+id,
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
        $("#inputForm6").form('submit',{
            url:'${pageContext.request.contextPath}/voice/update',
            success:function(){
                $da6.dialog('close',true);
                $dg6.datagrid('reload');
            }
        });
    }

    //保存图片
    function savePic(){
        $("#inputForm6").form('submit',{
            url:'${pageContext.request.contextPath}/voice/upLoadVoice',
            success:function(){
                $("#a6").dialog('close',true);
                $dg6.datagrid('reload');
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
        $da6.dialog('close',true);
    }


    //添加操作
    function add(){
        $('#a6').dialog({
            title: '添加',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/doc/voice/add.jsp',
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



    }
</script>


    <div  class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',">


            <div id="tb6">
                <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>

            </div>
            <table id="stuDg6" ></table>
            <div id="a6"></div>

        </div>
    </div>




