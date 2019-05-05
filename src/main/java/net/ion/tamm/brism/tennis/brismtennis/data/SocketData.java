package net.ion.tamm.brism.tennis.brismtennis.data;

import java.util.ArrayList;

public class SocketData
{
    public String clientId;
    public String templateId;
    public String gameName;
    public String player11;
    public String player12;
    public String player21;
    public String player22;
    public String score1;
    public String score2;
    public String point1;
    public String point2;
    public String setScore1;
    public String setScore2;
    public String setNo;
    public String serve;
    public String message;

    public ArrayList<String> scoreInSet1;
    public ArrayList<String> scoreInSet2;

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
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

    public String getPlayer11() {
        return player11;
    }

    public void setPlayer11(String player11) {
        this.player11 = player11;
    }

    public String getPlayer12() {
        return player12;
    }

    public void setPlayer12(String player12) {
        this.player12 = player12;
    }

    public String getPlayer21() {
        return player21;
    }

    public void setPlayer21(String player21) {
        this.player21 = player21;
    }

    public String getPlayer22() {
        return player22;
    }

    public void setPlayer22(String player22) {
        this.player22 = player22;
    }

    public String getScore1() {
        return score1;
    }

    public void setScore1(String score1) {
        this.score1 = score1;
    }

    public String getScore2() {
        return score2;
    }

    public void setScore2(String score2) {
        this.score2 = score2;
    }

    public String getPoint1() {
        return point1;
    }

    public void setPoint1(String point1) {
        this.point1 = point1;
    }

    public String getPoint2() {
        return point2;
    }

    public void setPoint2(String point2) {
        this.point2 = point2;
    }

    public String getSetScore1() {
        return setScore1;
    }

    public void setSetScore1(String setScore1) {
        this.setScore1 = setScore1;
    }

    public String getSetScore2() {
        return setScore2;
    }

    public void setSetScore2(String setScore2) {
        this.setScore2 = setScore2;
    }

    public String getSetNo() {
        return setNo;
    }

    public void setSetNo(String setNo) {
        this.setNo = setNo;
    }

    public String getServe() {
        return serve;
    }

    public void setServe(String serve) {
        this.serve = serve;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ArrayList<String> getScoreInSet1() {
        return scoreInSet1;
    }

    public void setScoreInSet1(ArrayList<String> scoreInSet1) {
        this.scoreInSet1 = scoreInSet1;
    }

    public ArrayList<String> getScoreInSet2() {
        return scoreInSet2;
    }

    public void setScoreInSet2(ArrayList<String> scoreInSet2) {
        this.scoreInSet2 = scoreInSet2;
    }
}
