<%@ taglib prefix="v-on" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/common.css" rel="stylesheet">
    <link href="/css/brism.css" rel="stylesheet">
    <link href="/css/animate.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <title>Brism-Tennis</title>
    <script>
        $(document).ready(function() {
           var socket = new WebSocket("ws://localhost:8080/api/socket/test1");
           socket.onopen = function (ev) {

           }
           socket.onmessage = function (ev) {

           }

           socket.onclose = function (ev) {

           }

           socket.onerror = function (ev) {
               console.log("Socket Error");
           }
        });
    </script>
</head>
<body>
<div class="brism-h-100" style="margin-top: 2rem">
    <!--<div class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;"-->
    <!--data-v-3fdfbd73="" data-v-13838786="">-->
    <!--<div class="brism-card brism-border-0" data-v-3fdfbd73="">-->
    <!--<div class="brism-card-header brism-p-2 brism-border-bottom" data-v-3fdfbd73="">-->
    <!--<div class="brism-float-left" data-v-3fdfbd73="">0000.00.00 00:00</div>-->
    <!--<div class="brism-float-right" data-v-3fdfbd73="">2019-05-01 16:41:49</div>-->
    <!--</div>-->
    <!--<div class="brism-card-body brism-p-1" data-v-3fdfbd73="">-->
    <!--<div class="brism-text-center brism-d-flex" data-v-3fdfbd73="">-->
    <!--<div class="brism-d-inline-flex brism-justify-content-end brism-align-items-center brism-flex-2"-->
    <!--data-v-3fdfbd73="">-->
    <!--<div class="brism-display-team-text brism-text-truncate brism-px-2"-->
    <!--data-v-3fdfbd73="">AWAY TEAM-->
    <!--</div>-->
    <!--<img src="img/team/none.png" class="brism-display-team-emblem brism-px-2"-->
    <!--data-v-3fdfbd73=""></div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-1"-->
    <!--data-v-3fdfbd73="">-->
    <!--vs-->
    <!--</div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-start brism-align-items-center brism-flex-2"-->
    <!--data-v-3fdfbd73=""><img src="img/team/none.png"-->
    <!--class="brism-display-team-emblem brism-px-2"-->
    <!--data-v-3fdfbd73="">-->
    <!--<div class="brism-display-team-text brism-text-truncate brism-px-2"-->
    <!--data-v-3fdfbd73="">HOME TEAM-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <div id="template-score" class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;display: none">
        <div class="brism-card brism-border-0" data-v-1963e0f4="">
            <div class="brism-card-header brism-p-2 brism-border-bottom" data-v-1963e0f4="">
                <div class="brism-float-left"><span data-id="game-name">게임명</span> - <span data-id="set-no">1</span><span> 세트</span></div>
                <div class="brism-float-right">
                    <div class="brism-display-counts"></div>
                </div>
            </div>
            <div class="brism-card-body brism-p-1">
                <div class="brism-text-center brism-d-flex">
                    <div class="brism-d-inline-flex brism-justify-content-end brism-align-items-center brism-flex-2">
                        <div active="true" class="brism-display-team-text brism-text-truncate brism-px-2" data-id="player1">AWAY TEAM</div>
                    </div>
                    <div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-1">
                        <span active="true" class="brism-display-team-r"  data-id="score1">15</span>
                        <span active="true" style="margin: 0 15px" data-id="set-score1">1</span>
                        <span>VS</span>
                        <span active="false" style="margin: 0 15px"  data-id="set-score2">0</span>
                        <span active="false" class="brism-display-team-r"  data-id="score2">15</span>
                    </div>
                    <div class="brism-d-inline-flex brism-justify-content-start brism-align-items-center brism-flex-2">
                        <div active="false" class="brism-display-team-text brism-text-truncate brism-px-2" id="player2" data-id="player2">HOME TEAM</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="template-closed" class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;display: none">
        <div class="brism-card brism-border-0">
            <div class="brism-card-header brism-p-2 brism-border-bottom"><span class="brism-d-block brism-text-center">경기가 종료되었습니다.</span></div>
            <div class="brism-card-body brism-p-1">
                <div class="brism-text-center brism-d-flex">
                    <div class="brism-d-inline-flex brism-justify-content-end brism-align-items-center brism-flex-2">
                        <div class="brism-display-team-text brism-text-truncate brism-px-2" data-id="player1">AWAY TEAM</div>
                    </div>
                    <div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-1">
                        <span class="brism-display-team-r" data-id="set-score1">3</span>
                        <span>VS</span>
                        <span class="brism-display-team-r" data-id="set-score2">0</span>
                    </div>
                    <div class="brism-d-inline-flex brism-justify-content-start brism-align-items-center brism-flex-2">
                        <div class="brism-display-team-text brism-text-truncate brism-px-2" data-id="player2">HOME TEAM</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--<div class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;"-->
    <!--data-v-4f92b498="" data-v-13838786="">-->
    <!--<div class="brism-card brism-border-0" data-v-4f92b498="">-->
    <!--<div class="brism-card-body brism-p-1" data-v-4f92b498="">-->
    <!--<div class="brism-text-center brism-d-flex" data-v-4f92b498="">-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-1"-->
    <!--data-v-4f92b498=""><span class="brism-display-inning-big"-->
    <!--data-v-4f92b498="">0</span>-->
    <!--<div class="brism-display-groupCodes-big" data-v-4f92b498=""><i active="true"-->
    <!--class="brism-display-groupCodes-true-big"-->
    <!--data-v-4f92b498=""></i>-->
    <!--<i active="false" class="brism-display-groupCodes-false-big"-->
    <!--data-v-4f92b498=""></i></div>-->
    <!--</div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-1"-->
    <!--data-v-4f92b498=""><img src="img/team/none.png"-->
    <!--class="brism-display-team-emblem brism-px-2"-->
    <!--data-v-4f92b498="">-->
    <!--<div class="brism-display-team-text brism-text-truncate brism-px-2"-->
    <!--data-v-4f92b498="">TEAM-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-2"-->
    <!--data-v-4f92b498="">-->
    <!--<div class="brism-display-batter-list" data-v-4f92b498=""><span data-v-4f92b498="">다음타자가 없습니다.</span>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;"-->
    <!--data-v-a726fffa="" data-v-13838786="">-->
    <!--<div class="brism-card brism-border-0" data-v-a726fffa="">-->
    <!--<div class="brism-card-body brism-p-1" data-v-a726fffa="">-->
    <!--<div class="brism-text-center brism-d-flex" data-v-a726fffa="">-->
    <!--<div class="brism-display-batter-header brism-d-inline-flex brism-flex-column brism-justify-content-center brism-align-items-center brism-flex-1 brism-border-right"-->
    <!--data-v-a726fffa=""><span data-v-a726fffa="">0</span> <span-->
    <!--class="brism-text-writing-mode-vertical-lr" data-v-a726fffa="">번타자</span></div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-6"-->
    <!--data-v-a726fffa="">-->
    <!--<div class="brism-display-batter-name brism-text-truncate brism-px-2"-->
    <!--data-v-a726fffa="">PLAYER-->
    <!--</div>-->
    <!--<div class="brism-display-batter-number brism-px-2" data-v-a726fffa="">00</div>-->
    <!--<img src="/brism/images/batter/none.png"-->
    <!--class="brism-display-batter-profile-img brism-rounded-circle brism-mx-2"-->
    <!--data-v-a726fffa=""></div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff;"-->
    <!--data-v-690be1e8="" data-v-13838786="">-->
    <!--<div class="brism-card brism-border-0" data-v-690be1e8="">-->
    <!--<div class="brism-card-body brism-p-1" data-v-690be1e8="">-->
    <!--<div class="brism-text-center brism-d-flex" data-v-690be1e8="">-->
    <!--<div class="brism-display-batter-header brism-d-inline-flex brism-flex-column brism-justify-content-center brism-align-items-center brism-flex-1 brism-border-right"-->
    <!--data-v-690be1e8=""><span data-v-690be1e8="">0</span> <span-->
    <!--class="brism-text-writing-mode-vertical-lr" data-v-690be1e8="">번타자</span></div>-->
    <!--<div class="brism-d-inline-flex brism-justify-content-center brism-align-items-center brism-flex-6"-->
    <!--data-v-690be1e8="">-->
    <!--<div class="brism-display-batter-name brism-text-truncate brism-px-2"-->
    <!--data-v-690be1e8="">PLAYER-->
    <!--</div>-->
    <!--<div class="brism-display-batter-number brism-px-2" data-v-690be1e8="">00</div>-->
    <!--<div class="brism-display-record-name brism-rounded-circle brism-d-flex brism-border brism-justify-content-center brism-align-items-center brism-text-truncate brism-mx-2"-->
    <!--data-v-690be1e8="">기록-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <div id="template-message" class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff; display: none">
        <div class="brism-card brism-border-0">
            <div class="brism-card-body brism-p-2">
                <div class="brism-text-center brism-d-flex">
                    <div class="brism-text-default"><marquee direction="left" data-id="message" style="width: 100%; height:120px; white-space: nowrap; font-size: 4rem; color: white">TEXT</marquee></div>
                </div>
            </div>
        </div>
    </div>
    <div id="template-ready" class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff; display: block">
        <div class="brism-card brism-border-0">
            <div class="brism-card-body brism-p-0">
                <div class="brism-text-center brism-d-flex">
                    <div style="width: 600px;height: 120px;overflow: hidden;display: flex;align-items: center;justify-content: center;">
                        <img src="http://demo.tamm.io:8081/brism/images/ion/none.png" width="600" height="120"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="template-black" class="brism-display-layout brism-font-weight-bold" style="background-color:#343a40;color:#ffffff; display: none">
        <div class="brism-card brism-border-0">
            <div class="brism-card-body brism-p-0">
                <div class="brism-text-center brism-d-flex">
                    <div>
                        <!--<video src="" width="600" height="120" loop="loop" style="object-fit: inherit;"></video>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<p style="width: 100%; text-align: right; margin-top: 1.5em; color: #3c3c3c">I-ON Communications Co, LTD</p>
</div>
</body>