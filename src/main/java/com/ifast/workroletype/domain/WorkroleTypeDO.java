package com.ifast.workroletype.domain;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableLogic;
import com.baomidou.mybatisplus.annotations.TableName;

import com.ifast.worker.domain.WorkerDO;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 
 * <pre>
 * 员工角色表
 * </pre>
 * <small> 2018-12-05 10:46:35 | canxue</small>
 */
@Data
@SuppressWarnings("serial")
@TableName("db_workrole_type")
@EqualsAndHashCode(callSuper=true) 
public class WorkroleTypeDO extends Model<WorkroleTypeDO> implements Serializable {
	@TableId
	private Long id;

    /** 角色名称 */
    private String name;

    /** 角色描述 */
    private String roleDesc;

    /** 角色状态1 正常 ,0 不正常 */
    private Integer roleStatus;

    /**  */
    @TableLogic
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
