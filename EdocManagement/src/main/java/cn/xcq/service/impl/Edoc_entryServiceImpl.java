package cn.xcq.service.impl;

import cn.xcq.dao.IEdoc_entryDAO;
import cn.xcq.entity.Edoc_category;
import cn.xcq.entity.Edoc_entry;
import cn.xcq.service.IEdoc_entryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/24
 * Time:13:57
 */
@Service("entryService")
public class Edoc_entryServiceImpl implements IEdoc_entryService {

    @Resource(name = "IEdoc_entryDAO")
    private IEdoc_entryDAO edocEntryDAO;

    //查询分类
    @Override
    public List<Edoc_category> findAllCategory() {
        return edocEntryDAO.findAllCategory();
    }
    //查询标题
    @Override
    public List<Edoc_entry> findAllEntry() {
        return edocEntryDAO.findAllEntry();
    }

    @Override
    public List<Edoc_entry> findAllById(int categoryid) {
        return edocEntryDAO.findAllById(categoryid);
    }

    @Override
    public int addEntry(Edoc_entry entry) {
        return edocEntryDAO.addEntry(entry);
    }

    @Override
    public int updateEntry(Edoc_entry entry) {
        return edocEntryDAO.updateEntry(entry);
    }

    @Override
    public Edoc_entry getEntry(Integer id) {
        return edocEntryDAO.getEntry(id);
    }

    @Override
    public int delEntry(Integer id) {
        return edocEntryDAO.delEntry(id);
    }

    public IEdoc_entryDAO getEdocEntryDAO() {
        return edocEntryDAO;
    }

    public void setEdocEntryDAO(IEdoc_entryDAO edocEntryDAO) {
        this.edocEntryDAO = edocEntryDAO;
    }
}
