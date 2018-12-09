package com.ifast.workroletype.controller;


import java.util.Arrays;
import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.ifast.common.annotation.Log;
import com.ifast.common.base.AdminBaseController;
import com.ifast.workroletype.domain.WorkroleTypeDO;
import com.ifast.workroletype.service.WorkroleTypeService;
import com.ifast.common.utils.Result;

/**
 * <pre>
 * 员工角色表
 * </pre>
 * <small> 2018-12-05 10:46:35 | canxue</small>
 */
@Controller
@RequestMapping("/workroletype/workroleType")
public class WorkroleTypeController extends AdminBaseController {
    @Autowired
    private WorkroleTypeService workroleTypeService;

    @GetMapping()
    @RequiresPermissions("workroletype:workroleType:workroleType")
    String WorkroleType() {
        return "workroletype/workroleType/workroleType";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("workroletype:workroleType:workroleType")
    public Result<Page<WorkroleTypeDO>> list(WorkroleTypeDO workroleTypeDTO) {
        Wrapper<WorkroleTypeDO> wrapper = new EntityWrapper<WorkroleTypeDO>().orderBy("id", false);
        Page<WorkroleTypeDO> page = workroleTypeService.selectPage(getPage(WorkroleTypeDO.class), wrapper);
        return Result.ok(page);
    }

    @GetMapping("/add")
    @RequiresPermissions("workroletype:workroleType:add")
    String add() {
        return "workroletype/workroleType/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("workroletype:workroleType:edit")
    String edit(@PathVariable("id") Long id, Model model) {
        WorkroleTypeDO workroleType = workroleTypeService.selectById(id);
        model.addAttribute("workroleType", workroleType);
        return "workroletype/workroleType/edit";
    }

    @Log("添加员工角色表")
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("workroletype:workroleType:add")
    public Result<String> save(WorkroleTypeDO workroleType) {
        workroleType.setGmtCreate(new Date());
        workroleType.setGmtModify(new Date());
        workroleTypeService.insert(workroleType);
        return Result.ok();
    }

    @Log("修改员工角色表")
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("workroletype:workroleType:edit")
    public Result<String> update(WorkroleTypeDO workroleType) {
        workroleType.setGmtModify(new Date());
        boolean update = workroleTypeService.updateById(workroleType);
        return update ? Result.ok() : Result.fail();
    }

    @Log("删除员工角色表")
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("workroletype:workroleType:remove")
    public Result<String> remove(Long id) {
        workroleTypeService.deleteById(id);
        return Result.ok();
    }

    @Log("批量删除员工角色表")
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("workroletype:workroleType:batchRemove")
    public Result<String> remove(@RequestParam("ids[]") Long[] ids) {
        workroleTypeService.deleteBatchIds(Arrays.asList(ids));
        return Result.ok();
    }

    /**
     * 修改员工角色启用状态
     *
     * @return
     */
    @Log("修改员工角色启用状态")
    @GetMapping("/updateStatus")
    @ResponseBody
    @RequiresPermissions("workruletype:workroleType:updateStatus")
    public Result<String> updateStatus(Long id, Integer roleStatus) {
        WorkroleTypeDO workroleTypeDO = new WorkroleTypeDO();
        workroleTypeDO.setId(id);
        workroleTypeDO.setRoleStatus(roleStatus);
        workroleTypeDO.setGmtCreate(new Date());
        boolean update = workroleTypeService.updateById(workroleTypeDO);
        return update ? Result.ok() : Result.fail();
    }

}
