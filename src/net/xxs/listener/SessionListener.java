package net.xxs.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import net.xxs.entity.Member;

/**
 * 监听器 - 记录登陆用户
 */

public class SessionListener implements HttpSessionAttributeListener  {

    /**  
     * 定义存储客户登录session的集合.  
     */  
    private static List sessions = new ArrayList();   
  
    /**  
     * 加入session时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeAdded(HttpSessionBindingEvent sbe) {   
        if (Member.MEMBER_ID_SESSION_NAME.equals(sbe.getName())) {   
            sessions.add(sbe.getValue());   
        }   
    }   
  
    /**  
     * session失效时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeRemoved(HttpSessionBindingEvent sbe) {   
        if (Member.MEMBER_ID_SESSION_NAME.equals(sbe.getName())) {   
            sessions.remove(sbe.getValue());   
        }   
    }   
  
    /**  
     * session覆盖时的监听方法.  
     *   
     * @param HttpSessionBindingEvent  
     *            session事件  
     */  
    public void attributeReplaced(HttpSessionBindingEvent sbe) {   
    }   
  
    /**  
     * 返回客户登录session的集合.  
     *   
     * @return  
     */  
    public static List getSessions() {   
        return sessions;   
    }   

}