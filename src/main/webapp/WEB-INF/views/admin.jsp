<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/common.css?v=124" rel="stylesheet">
    <link href="/css/brism2.css?v=123" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <title>Brism-Tennis</title>
    <script>
        var data = {
            clientId: '${clientId}',
            gameName: '',
            templateId: 'template-ready',
            player11: '플레이어1',
            player12: '플레이어2',
            player21: '플레이어1',
            player22: '플레이어2',
            score1: 0,
            score2: 0,
            setNo: 1,
            scoreInSet1: [],
            scoreInSet2: [],
            setScore1: 0,
            setScore2: 0,
            serve: '',
            message: ''
        };
        window.addEventListener('DOMContentLoaded', function() {
            var buttons = document.querySelectorAll('.screen');
            for (var button of buttons)
            {
                button.addEventListener('click', function (evt) {
                    var element = evt.target;

                    data.templateId = element.getAttribute('data-template');

                    removeClass(document.querySelector('button.screen.active'), 'active');
                    addClass(element, 'active');

                    applyData();
                });
            }

            buttons = document.querySelectorAll('button.serve');
            for (var button of buttons)
            {
                button.addEventListener('click', function (evt) {

                    removeClass(document.querySelector('button.serve.active'), 'active');
                    addClass(evt.target, 'active');

                    data.serve = evt.target.getAttribute('id');
                    applyData();
                })
            }

            buttons = document.querySelectorAll('[name="set-no"]');
            for (var button of buttons) {
                button.addEventListener('change', function (evt) {
                    var form = document.forms['dataForm'];
                    var val = parseInt(form['set-no'].value);

                    form['score-in-set1'][val-1].value = '0';
                    form['score-in-set2'][val-1].value = '0';

                    for (var i = val; i < 5; i++)
                    {
                        form['score-in-set1'][i].value = '';
                        form['score-in-set2'][i].value = '';
                    }

                    form['score1'].value = 0;
                    form['score2'].value = 0;

                    form['point1'].value = 0;
                    form['point2'].value = 0;

                    applyData();
                });
            }

            buttons = document.querySelectorAll('[name="score1"]');
            for (var button of buttons)
            {
                button.addEventListener('change', function (evt) {

                    var form = document.forms['dataForm'];
                    var val = form.score1.value;

                    form['point1'].value = val;

                    if (val == 'W')
                    {
                        var setNo = parseInt(form['set-no'].value);
                        form['score-in-set1'][setNo-1].value = parseInt(form['score-in-set1'][setNo-1].value) + 1;

                        form['score1'].value = 0;
                        form['score2'].value = 0;
                        form['point1'].value = 0;
                        form['point2'].value = 0;

                        setAttacker(setNo+1);
                    }

                    applyData();
                });
            }

            buttons = document.querySelectorAll('[name="score2"]');
            for (var button of buttons)
            {
                button.addEventListener('change', function (evt) {

                    var form = document.forms['dataForm'];
                    var val = form.score2.value;

                    form['point2'].value = val;

                    if (val == 'W')
                    {
                        var setNo = parseInt(form['set-no'].value);
                        form['score-in-set2'][setNo-1].value = parseInt(form['score-in-set2'][setNo-1].value) + 1;

                        form['score1'].value = 0;
                        form['score2'].value = 0;
                        form['point1'].value = 0;
                        form['point2'].value = 0;

                        setAttacker(setNo+1);
                    }

                    applyData();
                });
            }
        });

        function setAttacker(setNo)
        {
            var element1 = document.querySelector('#brism-scores1');
            var element2 = document.querySelector('#brism-scores2');

            var test = setNo % 2;
            if ((setNo % 2) == 0)
            {
                removeClass(element1, 'active');
                addClass(element2, 'active');
            }
            else
            {
                removeClass(element2, 'active');
                addClass(element1, 'active');
            }
        }

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
            var form = document.forms['dataForm'];
            data.gameName = form['gameName'].value;
            data.player11 = form['player11'].value;
            data.player12 = form['player12'].value;
            data.player21 = form['player21'].value;
            data.player22 = form['player22'].value;
            data.score1 = form['score1'].value;
            data.score2 = form['score2'].value;
            data.point1 = data.score1;
            data.point2 = data.score2;
            data.setNo = form['set-no'].value;

            data.scoreInSet1 = new Array();
            for (var i = 0; i < 5; i++)
                data.scoreInSet1.push(form['score-in-set1'][i].value);
            data.scoreInSet2 = new Array();
            for (var i = 0; i < 5; i++)
                data.scoreInSet2.push(form['score-in-set2'][i].value);

            data.setScore1 = 0;
            data.setScore2 = 0;

            for (var i = 0; i < parseInt(data.setNo); i++)
            {
                var score1 = parseInt(data.scoreInSet1[i]);
                var score2 = parseInt(data.scoreInSet2[i]);

                if (score1 > score2)
                    data.setScore1++;
                else if (score1 < score2)
                    data.setScore2++;
            }

            data.message = form['message'].value;

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

            var option = {
                method: 'POST',
                body: JSON.stringify(data)
            }
            fetch('http://localhost:8080/brism/update-data', option)
                .then(function (response) {
                    return response.json();
                })
                .then(function (result) {
                    if (result.result != true)
                    {
                        alert('Fail to send data to server');
                    }
                });
        }
    </script>
</head>
<body>
<div class="container">
    <div class="doc-container">
        <div class="form-wrapper">
            <form name="dataForm">
                <h2>BRISM - Tennis V0.1</h2>

                <p class="label">Game Name</p>
                <input type="text" name="gameName" placeholder="Game Name" value="제 12회 전국 직장인 테니스 대회">
                <p id="errorGameName" class="error" style="display: none">게임 이름은 누락될 수 없습니다.</p>

                <p class="label">Players and Scores</p>
                <table style="width: 100%; text-align: center">
                    <tr style="font-size: 12px">
                        <td>Player1</td>
                        <td>Player2</td>
                        <td style="width: 50px">Point</td>
                        <td style="width: 50px">1set</td>
                        <td style="width: 50px">2set</td>
                        <td style="width: 50px">3set</td>
                        <td style="width: 50px">4set</td>
                        <td style="width: 50px">5set</td>
                    </tr>
                    <tr>
                        <td><input type="text" name="player11" placeholder="Player Name" value="홍길동" style="margin: 0; width: 80%"><button
                                id="serve11" type="button" class="serve">S</button></td>
                        <td><input type="text" name="player12" placeholder="Player Name" value="신사임당" style="margin: 0; width: 80%"><button
                                id="serve12" type="button" class="serve">S</button></td>
                        <td><input type="text" name="point1"></td>
                        <td><input type="text" name="score-in-set1"></td>
                        <td><input type="text" name="score-in-set1"></td>
                        <td><input type="text" name="score-in-set1"></td>
                        <td><input type="text" name="score-in-set1"></td>
                        <td><input type="text" name="score-in-set1"></td>
                    </tr>
                    <tr>
                        <td><input type="text" name="player21" placeholder="Player Name" value="임꺽정" style="margin: 0; width: 80%"><button
                                id="serve21" type="button" class="serve">S</button></td>
                        <td><input type="text" name="player22" placeholder="Player Name" value="허난설헌" style="margin: 0; width: 80%"><button
                                id="serve22" type="button" class="serve">S</button></td>
                        <td><input type="text" name="point2" ></td>
                        <td><input type="text" name="score-in-set2"></td>
                        <td><input type="text" name="score-in-set2"></td>
                        <td><input type="text" name="score-in-set2"></td>
                        <td><input type="text" name="score-in-set2"></td>
                        <td><input type="text" name="score-in-set2"></td>
                    </tr>
                </table>

                <p class="label">Score</p>
                <div style="display: inline-block; width: 48%">
                    <input id="r1" name="score1" type="radio" class="score" value="0" checked="checked"><label for="r1">0</label>
                    <input id="r2" name="score1" type="radio" class="score" value="15"><label for="r2">15</label>
                    <input id="r3" name="score1" type="radio" class="score" value="30"><label for="r3">30</label>
                    <input id="r4" name="score1" type="radio" class="score" value="40"><label for="r4">40</label>
                    <input id="r5" name="score1" type="radio" class="score" value="A"><label for="r5">A</label>
                    <input id="rwin1" name="score1" type="radio" class="score" value="W"><label for="rwin1">W</label>
                </div>
                <div style="display: inline-block; width: 48%">
                    <input id="r6" name="score2" type="radio" class="score" value="0" checked="checked"><label for="r6">0</label>
                    <input id="r7" name="score2" type="radio" class="score" value="15"><label for="r7">15</label>
                    <input id="r8" name="score2" type="radio" class="score" value="30"><label for="r8">30</label>
                    <input id="r9" name="score2" type="radio" class="score" value="40"><label for="r9">40</label>
                    <input id="r10" name="score2" type="radio" class="score" value="A"><label for="r10">A</label>
                    <input id="rwin2" name="score2" type="radio" class="score" value="W"><label for="rwin2">W</label>
                </div>

                <p class="label">Set</p>
                <div style="display: inline-block; width: 48%">
                    <input id="r11" name="set-no" type="radio" class="score" value="1"><label for="r11">1</label>
                    <input id="r12" name="set-no" type="radio" class="score" value="2"><label for="r12">2</label>
                    <input id="r13" name="set-no" type="radio" class="score" value="3"><label for="r13">3</label>
                    <input id="r14" name="set-no" type="radio" class="score" value="4"><label for="r14">4</label>
                    <input id="r15" name="set-no" type="radio" class="score" value="5"><label for="r15">5</label>
                </div>

                <p class="label">Message</p>
                <input type="text" name="message" placeholder="Message">
                <p id="errorMessage" class="error" style="display: none">메시지는 누락될 수 없습니다.</p>

                <p class="label">Screen</p>
                <button type="button" class="screen" data-template="template-ready">대기화면</button>
                <button type="button" class="screen" data-template="template-score">점수 화면</button>
                <button type="button" class="screen" data-template="template-closed">종료 화면</button>
                <button type="button" class="screen" data-template="template-message">메시지 화면</button>
                <button type="button" class="apply" onclick="applyData()">화면갱신</button>
            </form>
        </div>
        <div class="brism-h-100" style="margin-top: 2rem">
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
        <p style="width: 100%; text-align: right; margin-top: 1.5em; color: #3c3c3c">I-ON Communications Co, LTD</p>
    </div>
</div>
</body>
</html>