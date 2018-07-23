package com.java456.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.java456.service.PublicService;
import com.java456.service.TreeService;
import com.java456.util.MyUtil;

/**
 * 主页Contrller
 * 版本 2.10 更新 上去
 */

@Controller
@RequestMapping("/")
public class IndexContrller {

	@Resource
	private TreeService treeService;
	@Resource
	private PublicService publicService;
	
	
	/**
	 * /wap/laws/index
	 * 请求主页
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletResponse  res,HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String UserAgent = req.getHeader("User-Agent");
		//判断AppleWebKit 和  Firefox
		
		if(MyUtil.checkUserAgent(UserAgent)){
			//pc端
			mav.setViewName("/pc/login/login");
		}else{
			//手机端
			mav.setViewName("/admin/common/s_mode");
		}
		
		System.out.println("【UserAgent】【】【】【】】【"+UserAgent);
		return mav;
	}
	
	
	/**
	 * 电脑登陆
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletResponse  res,HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		String UserAgent = req.getHeader("User-Agent");
		//判断AppleWebKit 和  Firefox
		
		if(MyUtil.checkUserAgent(UserAgent)){
			mav.setViewName("/pc/login/login");
		}else{
			mav.setViewName("/admin/common/s_mode");
		}
		
		System.out.println("【UserAgent】【】【】【】】【"+UserAgent);
		return mav;
	}
	
	
	/**
	 * 后台主页
	 */
	@RequestMapping("/admin/main")
	public ModelAndView admin_main(HttpServletResponse  res,HttpServletRequest req) throws Exception {
		ModelAndView mav = new ModelAndView();
		publicService.addLeftMenu(mav);
		
		System.out.println(MyUtil.getRemoteAddress(req));
		
		
		
		String UserAgent = req.getHeader("User-Agent");
		if(MyUtil.checkUserAgent(UserAgent)){
			mav.setViewName("/admin/main");
		}else{
			mav.setViewName("/admin/common/s_mode");
		}
		return mav;
	}
	
	
}
