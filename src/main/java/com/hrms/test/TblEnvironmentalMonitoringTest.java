package com.hrms.test;

import com.hrms.bean.TblEmp;
import com.hrms.bean.TblEnvironmentalMonitoring;
import com.hrms.mapper.TblEmpMapper;
import com.hrms.mapper.TblEnvironmentalMonitoringMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.Random;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "classpath:springmvc.xml"})
public class TblEnvironmentalMonitoringTest {

    @Autowired
    TblEnvironmentalMonitoringMapper tblEnvironmentalMonitoringMapper;

    @Test
    public void insertSelective(){
        for (int i = 0; i < 144 ; i++) {
            TblEnvironmentalMonitoring tblEnvironmentalMonitoring = new TblEnvironmentalMonitoring();
            tblEnvironmentalMonitoring.setDeviceName("设备a");
            tblEnvironmentalMonitoring.setMonitoringTime(new Date());
            tblEnvironmentalMonitoring.setTemperature(String.valueOf((new Random().nextInt(30-10)+10)));
            tblEnvironmentalMonitoring.setHumidity(String.valueOf((new Random().nextInt(60-40)+40)));
            tblEnvironmentalMonitoring.setDustConcentration(String.format("%.1f",new Random().nextDouble()*5+5));
            tblEnvironmentalMonitoringMapper.insertSelective(tblEnvironmentalMonitoring);
        }
        for (int i = 0; i < 144 ; i++) {
            TblEnvironmentalMonitoring tblEnvironmentalMonitoring = new TblEnvironmentalMonitoring();
            tblEnvironmentalMonitoring.setDeviceName("设备b");
            tblEnvironmentalMonitoring.setMonitoringTime(new Date());
            tblEnvironmentalMonitoring.setTemperature(String.valueOf((new Random().nextInt(30-10)+10)));
            tblEnvironmentalMonitoring.setHumidity(String.valueOf((new Random().nextInt(60-40)+40)));
            tblEnvironmentalMonitoring.setDustConcentration(String.format("%.1f",new Random().nextDouble()*5+5));
            tblEnvironmentalMonitoringMapper.insertSelective(tblEnvironmentalMonitoring);
        }
        for (int i = 0; i < 144 ; i++) {
            TblEnvironmentalMonitoring tblEnvironmentalMonitoring = new TblEnvironmentalMonitoring();
            tblEnvironmentalMonitoring.setDeviceName("设备c");
            tblEnvironmentalMonitoring.setMonitoringTime(new Date());
            tblEnvironmentalMonitoring.setTemperature(String.valueOf((new Random().nextInt(30-10)+10)));
            tblEnvironmentalMonitoring.setHumidity(String.valueOf((new Random().nextInt(60-40)+40)));
            tblEnvironmentalMonitoring.setDustConcentration(String.format("%.1f",new Random().nextDouble()*5+5));
            tblEnvironmentalMonitoringMapper.insertSelective(tblEnvironmentalMonitoring);
        }
    }


}
