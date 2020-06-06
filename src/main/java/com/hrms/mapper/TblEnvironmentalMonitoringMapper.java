package com.hrms.mapper;

import com.hrms.bean.TblEnvironmentalMonitoring;
import com.hrms.bean.TblEnvironmentalMonitoringExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TblEnvironmentalMonitoringMapper {
    long countByExample(TblEnvironmentalMonitoringExample example);

    int deleteByExample(TblEnvironmentalMonitoringExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TblEnvironmentalMonitoring record);

    int insertSelective(TblEnvironmentalMonitoring record);

    List<TblEnvironmentalMonitoring> selectByExample(TblEnvironmentalMonitoringExample example);

    TblEnvironmentalMonitoring selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TblEnvironmentalMonitoring record, @Param("example") TblEnvironmentalMonitoringExample example);

    int updateByExample(@Param("record") TblEnvironmentalMonitoring record, @Param("example") TblEnvironmentalMonitoringExample example);

    int updateByPrimaryKeySelective(TblEnvironmentalMonitoring record);

    int updateByPrimaryKey(TblEnvironmentalMonitoring record);
}