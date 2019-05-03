package net.ion.tamm.brism.tennis.brismtennis.websocket;


import com.fasterxml.jackson.databind.ObjectMapper;
import net.ion.tamm.brism.tennis.brismtennis.data.SocketData;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.config.annotation.EnableWebSocket;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@ServerEndpoint("/test/{clientId}")
public class SocketDataEndPoint
{
    private Session session;
    private String clientId;
    static Set<SocketDataEndPoint> endPoints = new CopyOnWriteArraySet<>();

    public SocketDataEndPoint()
    {
        int test1 = 123;
        String test2 = "" + test1;
    }

//    @Override
//    public void onOpen(Session session, EndpointConfig endpointConfig)
//    {
//        int test1 = 123;
//        String test2 = "" + test1;
//    }

    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId)
    {
        this.session = session;
        this.clientId = clientId;
        endPoints.add(this);
    }

    @OnMessage
    public void onMessage(Session session, String message)
    {
    }

    @OnClose
    public void onClose(Session session)
    {
        endPoints.forEach(endPoint -> {
            synchronized (endPoint) {
                try {
                    if (endPoint.session.getId().equals(session.getId()))
                    {
                        endPoints.remove(endPoint);
                        return;
                    }
                } catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
        });
    }

    @OnError
    public void onError(Session session, Throwable throwable)
    {
        System.out.println(throwable.toString());
    }

    public static void sendData(SocketData data) throws Exception
    {
        String clientId = data.clientId;
        ObjectMapper mapper = new ObjectMapper();
        String jsonText = mapper.writeValueAsString(data);
        SocketDataEndPoint.sendText(clientId, jsonText);
    }

    public static void sendText(String clientId, String text)
    {
        ObjectMapper mapper = new ObjectMapper();

        endPoints.forEach(endPoint -> {
            synchronized (endPoint) {
                try {
                    if (endPoint.clientId.equals(clientId))
                    {
                        endPoint.session.getBasicRemote().sendText(text);
                    }
                } catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
        });
    }
}
