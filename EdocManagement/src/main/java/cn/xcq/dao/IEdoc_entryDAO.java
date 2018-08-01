package cn.xcq.dao;

import cn.xcq.entity.Edoc_category;
import cn.xcq.entity.Edoc_entry;
import com.sun.org.apache.bcel.internal.generic.LSTORE;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/24
 * Time:13:51
 */
public interface IEdoc_entryDAO {
    //获取说有分类信息
    public List<Edoc_category> findAllCategory();
    //获取所有标题信息
    public List<Edoc_entry> findAllEntry();

    //分类查询
    public List<Edoc_entry> findAllById(@Param(value="categoryid")int categoryid);

    //新增
    public int addEntry(Edoc_entry entry);

    //修改
    public int updateEntry(Edoc_entry entry);

    //获取单个数据
    public Edoc_entry getEntry(Integer id);

    //删除
    public int delEntry(Integer id);



}
