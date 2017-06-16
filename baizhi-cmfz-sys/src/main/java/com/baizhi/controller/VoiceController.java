package com.baizhi.controller;

import com.baizhi.entity.Voice;
import com.baizhi.service.VoiceService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2017/6/15.
 */
@Controller
@RequestMapping("/voice")
public class VoiceController {

    @Resource
    private VoiceService voiceService;

    @RequestMapping("/findAll")
    @ResponseBody
    public List<Voice> findAll(){
        List<Voice> voices = voiceService.queryAll();
        return voices;
    }


    @RequestMapping("/findAllByIntroduceId")
    @ResponseBody
    public List<Voice> findAllByIntroduceId(String id){
        List<Voice> voices = voiceService.selectByIntroductionId(id);
        return voices;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public Voice findOne(String id){
        Voice voice = voiceService.queryOne(id);
        return voice;
    }

    @RequestMapping("/add")
    @ResponseBody
    public void add(Voice voice){
        voiceService.add(voice);
    }

    @RequestMapping("/drop")
    @ResponseBody
    public void drop(String id){
        voiceService.delete(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public void update(Voice voice){
        voiceService.change(voice);
    }

    @RequestMapping("/upLoadVoice")
    @ResponseBody
    public void upLoad(HttpSession session, MultipartFile voiceName, Voice voice) {
        String path=null;
        try {
            //获取服务器根目录
            String realPath = session.getServletContext().getRealPath("/");

            //创建目录
            File file = new File(realPath, "voiceFile");
            if (!file.exists()) {
                file.mkdirs();
            }
            //修改文件名称
            String newFileName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(voiceName.getOriginalFilename());
            //上传文件
            voiceName.transferTo(new File(file, newFileName));
            //给path赋值
            path = "http://localhost:8989/baizhi-cmfz-sys"+ "/voiceFile/" + newFileName;
            /*给音频的下载地址赋值*/
            voice.setDownloadUrl(path);
            /*下载大小*/
            String s = String.valueOf(voiceName.getSize());
            Integer integer = Integer.valueOf(s);
            voice.setSize(integer);
            /*文件原始名称*/
            voice.setTitle(voiceName.getOriginalFilename());
            System.out.println(voice);
            voiceService.add(voice);


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
