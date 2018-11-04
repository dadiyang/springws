package com.dadiyang.springws.config;

import com.dadiyang.springws.ws.EchoHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

/**
 * 配置开启 webSocket
 *
 * @author dadiyang
 * @date 2018/11/4
 */
@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry webSocketHandlerRegistry) {
        // withSockJS 声明启用支持 sockJS
        webSocketHandlerRegistry.addHandler(marcoHandler(), "/echo").withSockJS();
    }

    @Bean
    public WebSocketHandler marcoHandler() {
        return new EchoHandler();
    }
}
