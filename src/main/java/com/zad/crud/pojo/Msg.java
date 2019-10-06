package com.zad.crud.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回数据的类
 */
public class Msg {
    //成功100, 失败200
    private int code;
    private String msg;
    private Map<String, Object> map = new HashMap<>();

    //成功调用方法
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("操作成功");
        return result;
    }
    //失败调用方法
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("操作失败");
        return result;
    }

    //传输的数据
    public Msg addMap(String s, Object o){
        map.put(s, o);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}
