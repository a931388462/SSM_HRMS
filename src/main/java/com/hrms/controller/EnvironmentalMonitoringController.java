package com.hrms.controller;

import com.hrms.bean.TblEnvironmentalMonitoring;
import com.hrms.service.EnvironmentalMonitoringImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequestMapping(value = "/hrms")
public class EnvironmentalMonitoringController {

    @Autowired
    EnvironmentalMonitoringImpl enviroenmentalMonitoringImpl;

    /**
     * 查询监测数据
     * @param deviceName
     * @param monitoringTimeStr
     * @return
     */
    @RequestMapping(value = "/getEnvironmentalMonitoring", method = RequestMethod.GET)
    public ModelAndView getEnvironmentalMonitoring(@RequestParam(required = false,defaultValue = "设备a") String deviceName,@RequestParam(required = false,defaultValue = "2020-06-04") String monitoringTimeStr){
        List<TblEnvironmentalMonitoring> allEnvMonDatas = enviroenmentalMonitoringImpl.getAllEnvMonData(deviceName,monitoringTimeStr);
        //日期转化，画面显示
        for (TblEnvironmentalMonitoring em:allEnvMonDatas) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            String monitoringTimeStr2 = formatter.format(em.getMonitoringTime());
            em.setMonitoringTimeStr(monitoringTimeStr2);
        }
        ModelAndView mv = new ModelAndView("departmentPage");
        //将上述查询结果放到Model中，在JSP页面中可以进行展示
        mv.addObject("allEnvMonDatas", allEnvMonDatas);
        mv.addObject("selDeviceName", deviceName);
        mv.addObject("deviceNameList", new String[]{"设备a","设备b","设备c"});
        mv.addObject("selMonitoringTimeStr", monitoringTimeStr);
        mv.addObject("monitoringTimeStrList", new String[]{"2020-06-04","2020-06-05","2020-06-06"});
        return mv;
    }

}
