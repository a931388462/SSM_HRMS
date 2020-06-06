package com.hrms.service;

import com.hrms.bean.TblEmp;
import com.hrms.bean.TblEmpExample;
import com.hrms.bean.TblEnvironmentalMonitoring;
import com.hrms.bean.TblEnvironmentalMonitoringExample;
import com.hrms.mapper.TblEmpMapper;
import com.hrms.mapper.TblEnvironmentalMonitoringMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

@Service
public class EnvironmentalMonitoringImpl {

    @Autowired
    TblEnvironmentalMonitoringMapper tblEnvironmentalMonitoringMapper;

    /**
     * 取得所有环境监测数据
     * @return
     */
    public List<TblEnvironmentalMonitoring> getAllEnvMonData(String deviceName,String monitoringTimeStr){
        TblEnvironmentalMonitoringExample tem = new TblEnvironmentalMonitoringExample();
        TblEnvironmentalMonitoringExample.Criteria criteria = tem.createCriteria();
        if (!"".equals(deviceName)){
            criteria.andDeviceNameEqualTo(deviceName);
        }
        if (!"".equals(monitoringTimeStr)){
            //指定日期
            Date date = strToDate(monitoringTimeStr);
            criteria.andMonitoringTimeBetween(getStartOfDay(date),getEndOfDay(date));
            //criteria.andMonitoringTimeBetween(new Date(),new Date());
        }
        List<TblEnvironmentalMonitoring> tblEnvironmentalMonitorings = tblEnvironmentalMonitoringMapper.selectByExample(tem);
        return tblEnvironmentalMonitorings;
    }


    // 获得某天最小时间 2020-02-17 00:00:00
    public static Date getStartOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());
        LocalDateTime startOfDay = localDateTime.with(LocalTime.MIN);
        return Date.from(startOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }

    // 获得某天最大时间 2020-02-19 23:59:59
    public static Date getEndOfDay(Date date) {
        LocalDateTime localDateTime = LocalDateTime.ofInstant(Instant.ofEpochMilli(date.getTime()), ZoneId.systemDefault());;
        LocalDateTime endOfDay = localDateTime.with(LocalTime.MAX);
        return Date.from(endOfDay.atZone(ZoneId.systemDefault()).toInstant());
    }

    /**
     * 将短时间格式字符串转换为时间 yyyy-MM-dd
     * @param strDate
     * @return
     */
    public static Date strToDate(String strDate) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        ParsePosition pos = new ParsePosition(0);
        Date strtodate = formatter.parse(strDate, pos);
        return strtodate;
     }
}
