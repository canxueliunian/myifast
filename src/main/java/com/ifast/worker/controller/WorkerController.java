package com.ifast.worker.controller;


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
import com.ifast.worker.domain.WorkerDO;
import com.ifast.worker.service.WorkerService;
import com.ifast.common.utils.Result;

/**
 * 
 * <pre>
 * 清洁人员注册表
 * </pre>
 * <small> 2018-11-27 14:11:44 | canxue</small>
 */
@Controller
@RequestMapping("/worker/worker")
public class WorkerController extends AdminBaseController {
	@Autowired
	private WorkerService workerService;
	
	@GetMapping()
	@RequiresPermissions("worker:worker:worker")
	String Worker(){
			return "worker/worker/worker";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("worker:worker:worker")
	public Result<Page<WorkerDO>> list(WorkerDO workerDTO){
        Wrapper<WorkerDO> wrapper = new EntityWrapper<WorkerDO>().orderBy("id", false);
        Page<WorkerDO> page = workerService.selectPage(getPage(WorkerDO.class), wrapper);
        return Result.ok(page);
	}
	
	@GetMapping("/add")
	@RequiresPermissions("worker:worker:add")
	String add(){
	    return "worker/worker/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("worker:worker:edit")
	String edit(@PathVariable("id") Long id,Model model){
		WorkerDO worker = workerService.selectById(id);
		model.addAttribute("worker", worker);
	    return "worker/worker/edit";
	}
	
	@Log("添加清洁人员注册表")
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("worker:worker:add")
	public Result<String> save( WorkerDO worker){
		worker.setGmtCreate(new Date());
		worker.setGmtModify(new Date());
		workerService.insert(worker);
        return Result.ok();
	}
	
	@Log("修改清洁人员注册表")
	@ResponseBody
	@RequestMapping("/update")
		@RequiresPermissions("worker:worker:edit")
	public Result<String>  update( WorkerDO worker){
		worker.setGmtModify(new Date());
		boolean update = workerService.updateById(worker);
		return update ? Result.ok() : Result.fail();
	}
	
	@Log("删除清洁人员注册表")
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("worker:worker:remove")
	public Result<String>  remove( Long id){
		workerService.deleteById(id);
        return Result.ok();
	}
	
	@Log("批量删除清洁人员注册表")
		@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("worker:worker:batchRemove")
	public Result<String>  remove(@RequestParam("ids[]") Long[] ids){
		workerService.deleteBatchIds(Arrays.asList(ids));
		return Result.ok();
	}
	
}
