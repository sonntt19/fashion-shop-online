<%-- 
    Document   : post-detail
    Created on : Jun 23, 2022, 7:45:11 AM
    Author     : son22
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
    </head>
    <body>
        <form action="update-post" method="post">
            <textarea cols="20" rows="20" id="editor" name="content"></textarea>
            <input type="file"/>
            <input type="submit" name="submit" value="Submit" />
        </form>
        <script>
            var editor = CKEDITOR.replace('editor');
            CKFinder.setupCKEditor(editor, '<%=request.getContextPath()%>/ckfinder/');
        </script>
    </body>
</html>
