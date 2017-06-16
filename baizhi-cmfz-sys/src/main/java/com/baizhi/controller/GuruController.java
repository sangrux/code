package com.baizhi.controller;

import com.baizhi.entity.Guru;
import com.baizhi.entity.Picture;
import com.baizhi.service.GuruService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/13.
 */
@Controller
@RequestMapping("/guru")
public class GuruController {

    @Resource
    private GuruService guruService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Guru> findAll(){
        List<Guru> gurus = guruService.queryAll();
        return gurus;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public Guru findOne(String id){
        Guru guru = guruService.queryOne(id);
        return guru;
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(Guru guru){
        guruService.add(guru);
    }

    @RequestMapping("/drop")
    @ResponseBody
    public void drop(String id){
        guruService.delete(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(Guru guru){
        guruService.change(guru);
    }


    @RequestMapping("/upload")
    @ResponseBody
    public String add(MultipartFile aaa, HttpServletRequest request) throws IOException {


        //文件上传

        String realPath = request.getSession().getServletContext().getRealPath("/");

        /*//获取父路径
        String parent=new File(realPath).getParent();
        System.out.println(parent);*/
        File file=new File(realPath,"uploadFiles");
        if(!file.exists()){
            file.mkdirs();
        }
        String newFileName= UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(aaa.getOriginalFilename());

        Picture picture=new Picture();
        //文件上传
        aaa.transferTo(new File(file,newFileName));
        return "http://localhost:8989/baizhi-cmfz-sys"+"/uploadFiles/"+newFileName;

    }
}
