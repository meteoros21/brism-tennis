package net.ion.tamm.brism.tennis.brismtennis.websocket;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

@Component
@ServerEndpoint("/api/socket/{clientId}")
public class SocketDataEndPoint
{
    private Session session;
    private String clientId;
    static Set<SocketDataEndPoint> endPoints = new CopyOnWriteArraySet<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("clientId") String clientId)
    {
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
    }

    @OnError
    public void onError(Session session, Throwable throwable)
    {
        System.out.println(throwable.toString());
    }

    public static void sendData(String clientId, Map<String, Object> data)
    {
        ObjectMapper mapper = new ObjectMapper();

        endPoints.forEach(endPoint -> {
            synchronized (endPoint) {
                try {
                    if (endPoint.clientId.equals(clientId))
                    {
                        String jsonText = mapper.writeValueAsString(data);
                        endPoint.session.getBasicRemote().sendObject(jsonText);
                    }
                } catch (Exception e)
                {
                    e.printStackTrace();
                }
            }
        });
    }
}
