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
    <form>
        <h2>Brism - Tennis</h2>
        <input type="text" id="clientId" name="clientId" placeholder="Client ID">
        <button type="button" class="screen" style="width: 100%" onclick="goAdminPage()">Brism Operation</button>
        <button type="button" class="screen" style="width: 100%" onclick="goBoardPage()">Brism Sign Board</button>
        <p style="width: 100%; text-align: right; margin-top: 1.5em; color: #3c3c3c">I-ON Communications Co, LTD</p>
    </form>
    </div>
</div>
</body>