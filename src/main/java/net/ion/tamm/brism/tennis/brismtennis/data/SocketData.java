package net.ion.tamm.brism.tennis.brismtennis.data;

import java.util.Map;

public class SocketData
{
    public String templateId;
    public String gameName;
    public String player1;
    public String player2;
    public int score1;
    public int score2;
    public int setScore1;
    public int setScore2;
    public int currentSet;
    public String message;

    public void setValues(Map<String, Object> params)
    {
        this.templateId = (String)params.get("templateId");
        this.gameName = (String)params.get("gameName");
        this.player1 = (String)params.get("player1");
        this.player2 = (String)params.get("player2");

        this.score1 = (Integer) params.get("score1");
        this.score2 = (Integer) params.get("score2");

    }

    public String getTemplateId() {
        return templateId;
    }

    public void setTemplateId(String templateId) {
        this.templateId = templateId;
    }

    public String getGameName() {
        return gameName;
    }

    public void setGameName(String gameName) {
        this.gameName = gameName;
    }

    public String getPlayer1() {
        return player1;
    }

    public void setPlayer1(String player1) {
        this.player1 = player1;
    }

    public String getPlayer2() {
        return player2;
    }

    public void setPlayer2(String player2) {
        this.player2 = player2;
    }

    public int getScore1() {
        return score1;
    }

    public void setScore1(int score1) {
        this.score1 = score1;
    }

    public int getScore2() {
        return score2;
    }

    public void setScore2(int score2) {
        this.score2 = score2;
    }

    public int getSetScore1() {
        return setScore1;
    }

    public void setSetScore1(int setScore1) {
        this.setScore1 = setScore1;
    }

    public int getSetScore2() {
        return setScore2;
    }

    public void setSetScore2(int setScore2) {
        this.setScore2 = setScore2;
    }

    public int getCurrentSet() {
        return currentSet;
    }

    public void setCurrentSet(int currentSet) {
        this.currentSet = currentSet;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
