package com.baizhi.controller;

import com.baizhi.entity.Picture;
import com.baizhi.service.PictureService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/12.
 */
@Controller
@RequestMapping("/picture")
public class PictureController {
    @Resource
    private PictureService pictureService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Picture> findAll(){
        List<Picture> pictures = pictureService.queryAll();
        return pictures;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public Picture findOne(String id){
        Picture picture = pictureService.queryById(id);

        return picture;
    }

    @RequestMapping("/upload")
    @ResponseBody
    public String upload(MultipartFile aaa, HttpServletRequest request,Picture picture) throws IOException {

        //文件上传

        String realPath = request.getSession().getServletContext().getRealPath("/");

        /*//获取父路径
        String parent=new File(realPath).getParent();
*/
        File file=new File(realPath,"uploadFiles");
        if(!file.exists()){
            file.mkdirs();
        }
        String newFileName= UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());

        //文件上传
        aaa.transferTo(new File(file,newFileName));
        return "http://localhost:8989/baizhi-cmfz-sys"+"/uploadFiles/"+newFileName;
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(Picture picture){
        pictureService.add(picture);
    }

    @RequestMapping("/drop")
    @ResponseBody
    public void drop(String id){
        pictureService.delete(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(Picture picture){

        pictureService.change(picture);
    }
}
