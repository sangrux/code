
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<html>
<head>
    <title>main menu</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/css/IconExtension.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/form.validator.rules.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/easyui/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <script>
        var $aa,$tt;
        //修改日期的格式

        $(function(){
            $aa = $("#menus");
            $tt = $("#tt");
            //检查登录
            if("${admin}".length<1){
                pleasLogin();
            }
            //初始化系统菜单
            $.post("${pageContext.request.contextPath}/menu/findAll",function(menus){
                $.each(menus,function(i,menu){
                    var content = "<div style='text-align: center;'>";
                    $.each(menu.children,function(j,child){
                        //console.log(child);
                        // console.log(JSON.stringify(child));//将js中的js对象转为js中的字符串
                        content +="<div onclick=\"addTabs('"+child.name+"','"+child.photo+"','"+child.href+"')\" class='easyui-linkbutton' data-options=\"plain:true,iconCls:'"+child.photo+"'\" style='border:1px solid green; width:90%;margin: 5 0 5 0 ;'>"+child.name+"</div>";
                    })
                    content +="</div>";

                    $aa.accordion('add',{
                        title:menu.name,
                        iconCls:menu.photo,
                        content:content,
                    });
                });

            },"JSON");
        })

        //添加选项卡
        function  addTabs(title,iconCls,href){
            console.log(title);
            console.log(iconCls);
            console.log(href);
            if(!$tt.tabs('exists',title)){
                $tt.tabs('add',{
                    title:title,
                    iconCls:iconCls,
                    href:"${pageContext.request.contextPath}/"+href,
                    closable:true,
                });
            }else{
                $tt.tabs('select',title)
            }


        }


        //强制登陆
        function pleasLogin() {
            $('#win').window({
                width:200,
                height:100,
                modal:true,
                title:'登陆提示！',
                minimizable:false,
                onBeforeLoad:true,
                maximizable:false,
                collapsible:false,
                onClose:function(){
                    top.location = "${pageContext.request.contextPath}/pages/login.jsp";
                }
            });
        }

        //注销
        function logout(){
            if(confirm("确定退出吗？")){
                top.location = "${pageContext.request.contextPath}/admin/logout";
            }
        }
    </script>
</head>
<body class="easyui-layout">
<div id="win" style="text-align: center">
    <p>您暂未登录，请先进行登录！</p>
</div>
<!--页面顶部-->
<div data-options="region:'north',split:false" style="height:80px;text-align: center;" >
    <h2><span>持明法洲后台管理系统</span></h2>
    <div style="text-align:right;" >

        <a href="#" class="easyui-linkbutton" data-options="width:50,height:20,plain:true">${admin.name}</a>

        <%--<input class="easyui-linkbutton" data-options="">--%>
        <input  id="logout" onclick="logout()"  class="easyui-linkbutton" data-options="width:50,height:20,plain:true" value="注销">
    </div>
</div>
<!--底部-->
<div data-options="region:'south',split:false" style="height:80px;border:none">
    <center>

        <div class="">
            <hr/>
            <div class="copyright">
                Copyright (C) wwww网 2004-2088, All Rights Reserved
            </div>
            <div class="validate">
                <p>京ICP证041189号</p>
            </div>
        </div>
    </center>
</div>
<!--菜单-->
<div data-options="region:'west',title:'系统菜单',split:false,iconCls:'icon-computer_connect'" style="width:200px;">

    <div id="menus" class="easyui-accordion" data-options="fit:true" style="border:none;">
    </div>
</div>
<!--中心显示模块-->
<div data-options="region:'center',iconCls:'icon-house'" style="border:none;">
    <div id="tt" class="easyui-tabs" data-options="fit:true">
    </div>

</div>
</body>
</html>
