package com.ifast.worker.domain;

import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.ifast.common.base.BaseDO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * <pre>
 * 清洁人员注册表
 * </pre>
 * <small> 2018-11-27 14:11:44 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_worker")
@EqualsAndHashCode(callSuper=true) 
public class WorkerDO extends Model<WorkerDO> implements Serializable {
	@TableId
	private Long id;

    /** 工牌号 */
    private String workNo;

    /** 员工姓名 */
    private String workName;

    /** 平台编号 */
    private String platFormNo;

    /** 员工类型 */
    private Integer workType;

    /** 手机 */
    private String phone;

    /** openId */
    private String openId;

    /** 微信 */
    private String wechat;

    /** 头像路径 */
    private String imgPath;

    /** 保底工资 */
    private BigDecimal mininumSalary;

    /**  */
    private Integer status;

    /**  */
    private Date gmtCreate;

    /**  */
    private Date gmtModify;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
