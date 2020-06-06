package com.hrms.bean;

import java.util.Date;

public class TblEnvironmentalMonitoring {
    private Integer id;

    private String deviceName;

    private Date monitoringTime;

    private String temperature;

    private String humidity;

    private String dustConcentration;

    private String monitoringTimeStr;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName == null ? null : deviceName.trim();
    }

    public Date getMonitoringTime() {
        return monitoringTime;
    }

    public void setMonitoringTime(Date monitoringTime) {
        this.monitoringTime = monitoringTime;
    }

    public String getTemperature() {
        return temperature;
    }

    public void setTemperature(String temperature) {
        this.temperature = temperature == null ? null : temperature.trim();
    }

    public String getHumidity() {
        return humidity;
    }

    public void setHumidity(String humidity) {
        this.humidity = humidity == null ? null : humidity.trim();
    }

    public String getDustConcentration() {
        return dustConcentration;
    }

    public void setDustConcentration(String dustConcentration) {
        this.dustConcentration = dustConcentration == null ? null : dustConcentration.trim();
    }

    public String getMonitoringTimeStr() {
        return monitoringTimeStr;
    }

    public void setMonitoringTimeStr(String monitoringTimeStr) {
        this.monitoringTimeStr = monitoringTimeStr == null ? null : monitoringTimeStr.trim();
    }
}