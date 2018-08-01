package cn.xcq.controller;

import cn.xcq.entity.Edoc_category;
import cn.xcq.entity.Edoc_entry;
import cn.xcq.service.IEdoc_entryService;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/24
 * Time:13:59
 */
@Controller
public class Edoc_entryController {
    @Resource(name = "entryService")
    private IEdoc_entryService edocEntryService;

    @InitBinder//默认
    public void resolveException(WebDataBinder webDataBinder) {
        //设置转换格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        //参数一:转换格式      参数二:是否允许为空字符串
        webDataBinder.registerCustomEditor(Date.class,new CustomDateEditor(sdf,true));
    }

    //
    @RequestMapping("/index")
    public String index(Model model){
        List<Edoc_category> allCategory = edocEntryService.findAllCategory();//所有分类
        List<Edoc_entry> allEntry = edocEntryService.findAllEntry();    //所有标题
        model.addAttribute("category",allCategory);
        model.addAttribute("entry",allEntry);
        return "welcome";
    }


    //根据id查询
    @RequestMapping("/categoryById")
    @ResponseBody
    public Object findAllById(int categoryid){
        List<Edoc_entry> allById = edocEntryService.findAllById(categoryid);//获取数据
        return allById;//将结果返回
    }

    //加载添加页面
    @RequestMapping("/showAddEntry")
    public String showAddEntry(Integer id,Model model){
        List<Edoc_category> allCategory = edocEntryService.findAllCategory();//所有分类
        if(id!=null){
            model.addAttribute("update",edocEntryService.getEntry(id));
        }
        model.addAttribute("category",allCategory);
        return "addEntry";
    }


    //添加
    @RequestMapping("/addEntry")
    public String addCategory(Edoc_entry entry){
        int i = edocEntryService.addEntry(entry);
        return "redirect:index";
    }


    //修改
    @RequestMapping("/updateEntry")
    public String updateEntry(Edoc_entry entry){
        int i = edocEntryService.updateEntry(entry);

        return "redirect:index";
    }

    //删除
    @RequestMapping("/delEntry")
    @ResponseBody
    public Object delEntry(Integer id){
        int i = edocEntryService.delEntry(id);
        return i;
    }

}
