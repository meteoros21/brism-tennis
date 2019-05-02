package net.ion.tamm.brism.tennis.brismtennis.data;

import java.util.HashMap;
import java.util.Map;

public class SocketDataManager
{
    protected static SocketDataManager manager = null;
    private static Map<String, Object> socketData;

    protected SocketDataManager()
    {
        socketData = new HashMap<>();
    }

    public static SocketDataManager getInstance()
    {
        if (SocketDataManager.manager == null)
            SocketDataManager.manager = new SocketDataManager();

        return SocketDataManager.manager;
    }

    public Object getData(String key)
    {
        return socketData.get(key);
    }

    public void setData(String key, Object data)
    {
        socketData.put(key, data);
    }
}
