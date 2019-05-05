<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV=”Pragma” CONTENT=”no-cache”>
    <META HTTP-EQUIV=”Cache-Control” CONTENT=”no-cache”>
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/brism2.css?v=123" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <title>Brism-Tennis</title>
    <style>
        html, body {
            padding: 0;
            margin: 0;
        }
    </style>
    <script>
        var data = null;
        var clientId = '${clientId}';
        window.addEventListener('DOMContentLoaded', function() {
            var socket = new WebSocket("ws://localhost:8080/test/" + clientId);
            socket.onopen = function (ev) {
                console.log("Connected");
            }
            socket.onmessage = function (ev) {
                console.log("Data Received");
                console.log(ev.data);
                data = JSON.parse(ev.data);
                applyData();
            }

            socket.onclose = function (ev) {
                alert('서버와의 연결이 끊어졌습니다. 새로고침을 시도해 보십시오.');
            }

            socket.onerror = function (ev) {
                console.log("Socket Error");
            }

        });

        function addClass(element, className)
        {
            if (element == null)
                return;

            var classNameList = element.className.split(" ");
            if (classNameList.indexOf(className) == -1)
            {
                element.className += ' ' + className;
            }
        }

        function removeClass(element, className)
        {
            if (element == null)
                return;

            var className = element.className.split(className).join('');
            element.className = className
        }

        function applyData() {

            document.querySelectorAll("[data-id='game-name']").forEach(function (element) {
                element.innerText = data.gameName;
            });

            document.querySelectorAll("[data-id='player11']").forEach(function (element) {
                element.innerText = data.player11;
            });
            document.querySelectorAll("[data-id='player12']").forEach(function (element) {
                element.innerText = data.player12;
            });
            document.querySelectorAll("[data-id='player21']").forEach(function (element) {
                element.innerText = data.player21;
            });
            document.querySelectorAll("[data-id='player22']").forEach(function (element) {
                element.innerText = data.player22;
            });

            document.querySelectorAll("[data-id='point1']").forEach(function (element) {
                element.innerText = data.point1;
            });
            document.querySelectorAll("[data-id='point2']").forEach(function (element) {
                element.innerText = data.point2;
            });
            document.querySelectorAll("[data-id='set-no']").forEach(function (element) {
                element.innerText = data.setNo;
            });


            document.querySelectorAll("[data-id='score1-in-set1']").forEach(function (element) {
                element.innerText = data.scoreInSet1[0];
            });
            document.querySelectorAll("[data-id='score1-in-set2']").forEach(function (element) {
                element.innerText = data.scoreInSet1[1];
            });
            document.querySelectorAll("[data-id='score1-in-set3']").forEach(function (element) {
                element.innerText = data.scoreInSet1[2];
            });
            document.querySelectorAll("[data-id='score1-in-set4']").forEach(function (element) {
                element.innerText = data.scoreInSet1[3];
            });
            document.querySelectorAll("[data-id='score1-in-set5']").forEach(function (element) {
                element.innerText = data.scoreInSet1[4];
            });


            document.querySelectorAll("[data-id='score2-in-set1']").forEach(function (element) {
                element.innerText = data.scoreInSet2[0];
            });
            document.querySelectorAll("[data-id='score2-in-set2']").forEach(function (element) {
                element.innerText = data.scoreInSet2[1];
            });
            document.querySelectorAll("[data-id='score2-in-set3']").forEach(function (element) {
                element.innerText = data.scoreInSet2[2];
            });
            document.querySelectorAll("[data-id='score2-in-set4']").forEach(function (element) {
                element.innerText = data.scoreInSet2[3];
            });
            document.querySelectorAll("[data-id='score2-in-set5']").forEach(function (element) {
                element.innerText = data.scoreInSet2[4];
            });


            document.querySelectorAll("[data-id='set-score1']").forEach(function (element) {
                element.innerText = data.setScore1;
            });
            document.querySelectorAll("[data-id='set-score2']").forEach(function (element) {
                element.innerText = data.setScore2;
            });
            document.querySelectorAll("[data-id='message']").forEach(function (element) {
                element.innerText = data.message;
            });

            document.querySelectorAll("div.brism-sign-board").forEach(function (element) {
                element.style.display = 'none';
            });

            document.querySelectorAll('.serve-player').forEach(function (element) {
                removeClass(element, 'active');
            })
            document.querySelectorAll('[data-id="' + data.serve + '"]').forEach(function (element) {
                addClass(element, 'active');
            })

            if (data.templateId == 'template-score' || data.templateId == 'template-closed')
            {
                if (data.player12 == '' && data.player22 == '')
                    document.querySelector("#" + data.templateId + "1").style.display = 'block';
                else
                    document.querySelector("#" + data.templateId + "2").style.display = 'block';
            }
            else
            {
                document.querySelector("#" + data.templateId).style.display = 'block';
            }
        }
    </script>
</head>
<body>
<div class="brism-h-100">
    <div id="template-score1" class="brism-sign-board" style="display: none">
        <div class="flex-container">
            <div class="table">
                <div class="row header">
                    <div class="cell point-header">points</div>
                    <div class="cell">Players</div>
                    <div class="cell score-header">1</div>
                    <div class="cell score-header">2</div>
                    <div class="cell score-header">3</div>
                    <div class="cell score-header">4</div>
                    <div class="cell score-header">5</div>
                </div>
                <div class="row">
                    <div class="cell border-top point" data-id="point1">15</div>
                    <div class="cell border-top name1"><span id="server11" class="serve-player active" data-id="serve11"></span><span data-id="player11">홍길동</span></div>
                    <div class="cell border-top score" data-id="score1-in-set1">6</div>
                    <div class="cell border-top score" data-id="score1-in-set2">4</div>
                    <div class="cell border-top score" data-id="score1-in-set3">-</div>
                    <div class="cell border-top score" data-id="score1-in-set4">-</div>
                    <div class="cell border-top score" data-id="score1-in-set5">-</div>
                </div>
                <div class="row">
                    <div class="cell border-top point" data-id="point2">15</div>
                    <div class="cell border-top name1"><span id="server21" class="serve-player" data-id="serve21"></span><span data-id="player21">임꺽정</span></div>
                    <div class="cell border-top score" data-id="score2-in-set1">4</div>
                    <div class="cell border-top score" data-id="score2-in-set2">3</div>
                    <div class="cell border-top score" data-id="score2-in-set3">-</div>
                    <div class="cell border-top score" data-id="score2-in-set4">-</div>
                    <div class="cell border-top score" data-id="score2-in-set5">-</div>
                </div>
            </div>
        </div>
    </div>
    <div id="template-score2" class="brism-sign-board" style="display: none">
        <div class="flex-container">
            <div class="table">
                <div class="row header">
                    <div class="cell point-header">points</div>
                    <div class="cell">Players</div>
                    <div class="cell"></div>
                    <div class="cell score-header">1</div>
                    <div class="cell score-header">2</div>
                    <div class="cell score-header">3</div>
                    <div class="cell score-header">4</div>
                    <div class="cell score-header">5</div>
                </div>
                <div class="row">
                    <div class="cell border-top point" data-id="point1">15</div>
                    <div class="cell border-top name2"><span class="serve-player active" data-id="serve11"></span><span data-id="player11">홍길동</span></div>
                    <div class="cell border-top name3"><span class="serve-player" data-id="serve12"></span><span data-id="player12">홍길동</span></div>
                    <div class="cell border-top score" data-id="score1-in-set1">6</div>
                    <div class="cell border-top score" data-id="score1-in-set2">4</div>
                    <div class="cell border-top score" data-id="score1-in-set3">-</div>
                    <div class="cell border-top score" data-id="score1-in-set4">-</div>
                    <div class="cell border-top score" data-id="score1-in-set5">-</div>
                </div>
                <div class="row" style="border-top: 1px solid white">
                    <div class="cell border-top point" data-id="point2">15</div>
                    <div class="cell border-top name2"><span class="serve-player" data-id="serve21"></span><span data-id="player21">임꺽정</span></div>
                    <div class="cell border-top name3"><span class="serve-player" data-id="serve22"></span><span data-id="player22">신사임당</span></div>
                    <div class="cell border-top score" data-id="score2-in-set1">4</div>
                    <div class="cell border-top score" data-id="score2-in-set2">3</div>
                    <div class="cell border-top score" data-id="score2-in-set3">-</div>
                    <div class="cell border-top score" data-id="score2-in-set4">-</div>
                    <div class="cell border-top score" data-id="score2-in-set5">-</div>
                </div>
            </div>
        </div>
    </div>
    <div id="template-closed1" class="brism-sign-board" style="display: none">
        <div class="brism-sign-title-bar">
            <div>게임이 종료되었습니다.</div>
        </div>
        <div class="flex-container" style="height: 90px">
            <div style="width: 47%; display: flex; align-items: center; justify-content: center">
                <div class="result-point" data-id="set-score1">3</div>
                <div class="result-name-group">
                    <div class="result-name" style="text-align: right" data-id="player11">홍길동</div>
                </div>
            </div>
            <div style="width: 6%">vs</div>
            <div style="width: 47%; display: flex; align-items: center; justify-content: center">
                <div class="result-name-group">
                    <div class="result-name" data-id="player21">임꺽정</div>
                </div>
                <div class="result-point" data-id="set-score2">3</div>
            </div>
        </div>
    </div>
    <div id="template-closed2" class="brism-sign-board" style="display: none">
        <div class="brism-sign-title-bar">
            <div>게임이 종료되었습니다.</div>
        </div>
        <div class="flex-container" style="height: 90px">
            <div style="width: 47%; display: flex; align-items: center; justify-content: center">
                <div class="result-point" data-id="set-score1">3</div>
                <div class="result-name-group">
                    <div class="result-name" style="text-align: right" data-id="player11">홍길동</div>
                    <div class="result-name" style="text-align: right" data-id="player12">김순이 입니다요.</div>
                </div>
            </div>
            <div style="width: 6%">vs</div>
            <div style="width: 47%; display: flex; align-items: center; justify-content: center">
                <div class="result-name-group">
                    <div class="result-name" data-id="player21">임꺽정</div>
                    <div class="result-name" data-id="player22">신사임당입니다</div>
                </div>
                <div class="result-point" data-id="set-score2">3</div>
            </div>
        </div>
    </div>
    <div id="template-ready" class="brism-sign-board" style="background-color: white; display: none">
        <div class="flex-container">
            <img src="/img/none.png" style="width: 480px">
        </div>
    </div>
    <div id="template-message" class="brism-sign-board" style="display: none">
        <div class="flex-container">
            <div>
                <marquee direction="left" data-id="message" style="width: 100%; font-size: 4rem">Hello World Hello World</marquee>
            </div>
        </div>
    </div>
    <div id="template-black" class="brism-sign-board" style="display: block">
    </div>
</div>
</div>
</body>