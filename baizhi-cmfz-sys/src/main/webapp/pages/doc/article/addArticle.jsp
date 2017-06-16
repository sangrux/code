<%--
  Created by IntelliJ IDEA.
  User: acer1
  Date: 2017/6/12
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<div style="text-align: center;">
    <div style="margin-top: 30px">
        <h1>编辑文章的内容</h1>
        <form id="articleForm" method="post">
            标题：<input name="title" class="easyui-textbox" data-options="required:true"/> &nbsp;&nbsp;
            作者：<input name="author" class="easyui-textbox" data-options="required:true"/>&nbsp;&nbsp;
            时间：<input name="createDate" class="easyui-datebox" data-options="required:true"/><br/><br/>
            类型：<input name="contentType" class="easyui-textbox" data-options="required:true"/> &nbsp;&nbsp;
            链接：<input name="link" class="easyui-textbox" data-options="required:true"/> &nbsp;&nbsp;
            <textarea id="editor" name="content" class="editor" style="width: 100%;display: none" ></textarea>
        </form>
    </div>
</div>
<script type="text/javascript">

        Window.editor = KindEditor.create("#editor", {
            themeType:"simple",//修改主题
            height: "600px",
            items: [
                "source",
                "preview","fullscreen","clearhtml","|",
                "undo", "redo","|",
                "copy", "paste","plainpaste", "wordpaste",
                "|",
                "justifycenter", "justifyright",
                "justifyfull", "insertorderedlist",
                "insertunorderedlist", "indent", "outdent",  "|",
                "formatblock", "fontname", "fontsize",
                "forecolor", "hilitecolor", "bold",
                "italic", "underline", "strikethrough",
                "lineheight", "removeformat", "|", "image","table", "hr",
                "emoticons", "baidumap", "pagebreak",
                "anchor", "link", "unlink"
            ],
            langType: 'zh_CN',
            syncType: "form",
            filterMode: false,
            pagebreakHtml: '<hr class="pageBreak" \/>',
            allowFileManager: true,
            filePostName: "image",
            fileManagerJson:"${pageContext.request.contextPath }/imgs/browser",
            uploadJson:
                    "${pageContext.request.contextPath }/imgs/uploadImg",
            extraFileUploadParams: {
                token: getCookie("token")
            },
            afterChange: function() {
                this.sync();
            }

    });
</script>
