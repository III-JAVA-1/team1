package com.web.pet.forum.webSocket.config;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.web.pet.forum.webSocket.MsgScoketHandle;

@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig2 implements WebSocketConfigurer {

	  private static final Logger logger = LoggerFactory.getLogger(WebSocketConfig2.class);
	    @Override
	    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
	        System.out.println("==============註冊socket============");
	        //注册websocket server实现类，"/webSocket"访问websocket的地址
	        registry.addHandler(new MsgScoketHandle(),
	                "/webSocket").
	                addInterceptors(new HttpSessionHandshakeInterceptor());
	        //使用socketjs的注册方法
	        registry.addHandler(new MsgScoketHandle(),
	                "/sockjs/webSocket").
	                addInterceptors(new HttpSessionHandshakeInterceptor())
	                .withSockJS();
	    }
	    
	    /**
	     *
	     * @return 消息发送的Bean
	     */
	    @Bean(name = "msgSocketHandle")
	    public WebSocketHandler msgSocketHandle(){
	        return new MsgScoketHandle();
	    }

}
