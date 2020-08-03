package com.qtu.entity;

import java.util.Date;

public class ToDoList {
    private Integer id;

    private String theme;

    private String subject;

    private Date time;

    private String faqipeople;

    private String themestate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getFaqipeople() {
        return faqipeople;
    }

    public void setFaqipeople(String faqipeople) {
        this.faqipeople = faqipeople;
    }

    public String getThemestate() {
        return themestate;
    }

    public void setThemestate(String themestate) {
        this.themestate = themestate;
    }
}