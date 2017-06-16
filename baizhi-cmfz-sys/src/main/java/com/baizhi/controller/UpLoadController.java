package com.baizhi.controller;

import com.baizhi.entity.Voice;
import com.baizhi.service.VoiceService;
import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.UUID;

/**
 * Created by xumc on 2017/6/14.
 */
@RequestMapping("/upLoad")
@Controller
public class UpLoadController {
    private static final Logger LOGGER=Logger.getLogger(UpLoadController.class);
    /*注入依赖*/
    @Autowired
    private VoiceService voiceService;

    @RequestMapping("/upLoadVoice")
    @ResponseBody
    public void upLoad(HttpServletRequest request, MultipartFile voiceName, Voice voice) {
        String path=null;
        try {
            //获取服务器根目录
            String realPath = request.getSession().getServletContext().getRealPath("/");

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
            path ="http://localhost:8989/baizhi-cmfz-sys"+"/uploadFiles/"+"/voiceFile/" + newFileName;
            /*给音频的下载地址赋值*/
            voice.setDownloadUrl(path);
            /*下载大小*/
            String s = String.valueOf(voiceName.getSize());
            Integer integer = Integer.valueOf(s);
            voice.setSize(integer);
            /*文件原始名称*/
            voice.setTitle(voiceName.getOriginalFilename());
            LOGGER.debug("voice:"+voice);
            System.out.println(voice);
            voiceService.add(voice);


        } catch (Exception e) {
            e.printStackTrace();
        }

        LOGGER.debug("path："+path);
        LOGGER.debug("fNmae"+voiceName);
        //LOGGER.debug("路径："+newFileName);

    }
}
