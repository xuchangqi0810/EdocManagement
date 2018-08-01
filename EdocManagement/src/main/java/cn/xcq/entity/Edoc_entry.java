package cn.xcq.entity;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator
 * User:xcq
 * Date:2018/7/24
 * Time:13:43
 */
public class Edoc_entry {
    private Integer id;
    private Integer categoryId;
    private String title;
    private String summary;
    private String uploaduser;
    private Date createdate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getUploaduser() {
        return uploaduser;
    }

    public void setUploaduser(String uploaduser) {
        this.uploaduser = uploaduser;
    }

    public String getCreatedate() {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(createdate);
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }
}
