package net.ion.tamm.brism.tennis.brismtennis.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import net.ion.tamm.brism.tennis.brismtennis.data.SocketData;
import net.ion.tamm.brism.tennis.brismtennis.data.SocketDataManager;
import net.ion.tamm.brism.tennis.brismtennis.websocket.SocketDataEndPoint;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class BrismController
{
    @PostMapping("/brism/update-data")
    public Map<String, Object> updateData(@RequestBody String reqData) throws Exception
    {
        ObjectMapper mapper = new ObjectMapper();
        SocketData data = mapper.readValue(reqData, SocketData.class);

        SocketDataManager manager = SocketDataManager.getInstance();
        manager.setData(data.clientId, data);

        SocketDataEndPoint.sendData(data);

        Map<String, Object> result = new HashMap<>();
        result.put("result", true);

//        SocketData data = new SocketData();
//        data.setValues(params);
//
//        String key = (String)params.get("brismId");
//        SocketDataManager.getInstance().setData(key, params);



        return result;
    }
}
