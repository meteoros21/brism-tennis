<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/common.css?v=124" rel="stylesheet">
    <title>Brism-Tennis</title>
    <script>
        function goAdminPage() {
            var element = document.querySelector('#clientId');
            var clientId = element.value;

            window.location.href = 'admin/' + clientId;
        }
        function goBoardPage() {
            var element = document.querySelector('#clientId');
            var clientId = element.value;

            window.location.href = 'brism/' + clientId;
        }
    </script>
</head>
<body>
<div class="container">
    <div class="doc-container" style="width: 300px">
        <div>
            <h1>Error Page</h1>
            error code : <span>${code}</span>
            <br>error msg : <span>${msg}</span>
            <br>timestamp : <span>${timestamp}</span>
        </div>

    </div>
</div>
</body>