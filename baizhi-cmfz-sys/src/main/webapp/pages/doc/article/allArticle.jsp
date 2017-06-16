<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>

<script>
    var $dg,$da;
    $(function () {
        $dg = $("#articleDg");
        $da = $("#articleDa");
        $dg.datagrid({
            url: '${pageContext.request.contextPath}/article/queryAll',
            sortName:'id',
            remoteSort:false,
            fitColumns:true,
            method:'get',
            width:'100%',
            height:'100%',
            columns: [[
                {title: "编号", field: "id", width: 200, align: 'center'},
                {title: "标题", field: "title", width: 200, align: 'center'},
                {title: "链接(点击预览)", field: "link", width: 200, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a target='_black' href='${pageContext.request.contextPath}/pages/doc/article/articlePage.jsp?id="+row.id+"'>"+row.link+"</a>&nbsp;&nbsp;" ;
                    }
                },
                {title: "作者", field: "author", width: 200, align: 'center'},
                {title: "发布时间", field: "createDate", width: 200, align: 'center'},
                {title: "文章类型", field: "contentType", width: 200, align: 'center'},
                {
                    title: "操作", field: "options", width: 300, align: 'center',
                    formatter: function (value, row, index) {
                        return "<a class='del' onClick=\"delArticle('" + row.id + "')\" href='javascript:;'>删除</a>&nbsp;&nbsp;";
                    }
                }
            ]],
            onLoadSuccess: function (data) {
                $(".del").linkbutton({
                    plain: true,
                    iconCls: 'icon-remove',
                });
            },
            pagination:true,
            pageNumber:1,
            pageSize:2,
            pageList:[1,2,3],
            toolbar:'#articleTb',
        });
    });

    //删除的操作
    function delArticle(id){
        $.messager.confirm("提示","您确定要删除吗?",function(r){
            if(r){
                $.get('${pageContext.request.contextPath}/article/delete',{"id":id},function () {
                    $dg.datagrid('reload');
                })
            }

        });
    }
    //添加信息
    function addRow(){
        $da.dialog({
            width:600,
            height:300,
            collapsible:true,
            maximized:true,
            title:"添加图片详细信息",
            iconCls:"icon-man",
            href:'${pageContext.request.contextPath}/pages/doc/article/addArticle.jsp',
            buttons:[{
                text:'保存',
                iconCls:'icon-save',
                handler:saveArticle,
            },{
                text:'关闭',
                iconCls:'icon-cancel',
                handler:closeDa,
            }],

        });
    }
    //保存
    function saveArticle(){
        $("#articleForm").form('submit',{
            url:'${pageContext.request.contextPath}/article/add',
            success:function(){
                $da.dialog('close',true);
                $dg.datagrid('reload');
            }
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
        <table id="articleDg" ></table>
        <div id="articleDa"></div>
        <div id="articleTb">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true,onClick:addRow">添加</a>
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




