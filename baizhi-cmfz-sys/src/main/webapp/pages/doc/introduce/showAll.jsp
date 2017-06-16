<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg2,$da2;
    $(function () {
        $dg5 = $("#stuDg5");
        $da5 = $("#a5");
        $dg5.datagrid({
            url: '${pageContext.request.contextPath}/introduce/findAll',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "ID", field: "id", width: 200, align: 'center'},
                {title: "缩略图", field: "photoPath", width: 200, align: 'center',
                    formatter:function(value,row,index){
                        return "<a href='"+row.photoPath+"' target='_blank'>"+row.photoPath+"</a>";;
                    }
                },
                {title: "专辑名", field: "title", width: 200, align: 'center'},
                {title: "分数", field: "score", width: 200, align: 'center'},
                {title: "作者", field: "author", width: 200, align: 'center'},
                {title: "播音", field: "broadcast", width: 200, align: 'center'},
                {title: "集数", field: "setCount", width: 200, align: 'center'},
                {title: "内容简介", field: "brief", width: 200, align: 'center'},
                {title: "发布日期", field: "createDate", width: 200, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del2' onClick=\"del('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;" +
                                "<a class='edit2' onClick=\"editRow('" + row.id + "')\"  href='javascript:;'>修改</a>&nbsp;&nbsp;"+
                                "<a class='det' onClick=\"detail('" + row.id + "')\"  href='javascript:;'>查看详情</a>";

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
                $(".det").linkbutton({
                    plain:true,
                    iconCls:'icon-edit',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[2,4,6,8,10],
            toolbar:'#tb5',

        });
    });

    //删除的操作
    function del(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.post('${pageContext.request.contextPath}/introduce/drop',{"id":id});
                $dg5.datagrid('reload');
            }
        });
    }


    //修改的操作
    function editRow(id){
        $da5.dialog({
            width:600,
            height:300,
            title:"图片的详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/doc/introduce/edit.jsp?id='+id,
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
        $("#inputForm5").form('submit',{
            url:'${pageContext.request.contextPath}/introduce/update',
            success:function(){
                $da5.dialog('close',true);
                $dg5.datagrid('reload');
            }
        });
    }

    //保存图片
    function savePic(){
        $("#inputForm5").form('submit',{
            url:'${pageContext.request.contextPath}/introduce/add',
            success:function(){
                $("#a5").dialog('close',true);
                $dg5.datagrid('reload');
            }
        });
    }

    //关闭对话框
    function closeDa(){
        $da5.dialog('close',true);
    }


    //添加操作
    function add(){
        $da5.dialog({
            title: '添加',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/doc/introduce/add.jsp',
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

    //查看详情
    function detail(id){
        $('#d').dialog({
            title: '查看章节',
            width: 400,
            height: 400,
            closed: false,
            cache: false,
            href: '${pageContext.request.contextPath}/pages/doc/introduce/look.jsp?id='+id,
            modal: true,
            buttons:[{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });

    }

</script>


    <div  class="easyui-layout" data-options="fit:true">

        <div data-options="region:'center',">
            <table id="stuDg5" ></table>

            <div id="tb5">
                <a href="#" onClick="add()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>

            </div>
            <div id="a5"></div>
            <div id="d"></div>
        </div>
    </div>




