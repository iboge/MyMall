package com.hwua.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hwua.admin.service.PictureService;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@RequestMapping("/upload")
public class FileUploadController {

    private String accessKey;
    private String secretKey;
    private String bucket;
    private String domain;
    @Autowired
    private PictureService pictureService;

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public void setAccessKey(String accessKey) {
        this.accessKey = accessKey;
    }

    public void setSecretKey(String secretKey) {
        this.secretKey = secretKey;
    }

    public void setBucket(String bucket) {
        this.bucket = bucket;
    }

    @RequestMapping("/uploadPage")
    public String upload(){
        return "upload";
    }

    @RequestMapping(value = "/fileUpload",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String fileUpload(MultipartFile file, Map<String,Object> map, HttpSession session) throws IOException {
        byte[] bytes = file.getBytes();
        //构造一个带指定Zone对象的配置类
        Configuration configuration = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(configuration);
        System.out.println("accessKey = " + accessKey);
        System.out.println("secretKey = " + secretKey);
        //生成上传凭证，然后准备上传
        Auth auth = Auth.create(accessKey, secretKey);
        String uploadToken = auth.uploadToken(bucket);
        //key：如果不设置key，会使用文件内容的hash值作为key
        //同一个文件hash值相同
        Response response = uploadManager.put(bytes, null, uploadToken);
        //获取响应体的字符串
        String bodyString = response.bodyString();
        DefaultPutRet putRet = JSON.parseObject(bodyString, DefaultPutRet.class);
        String imgUrl = domain+putRet.key;
        map.put("imgUrl",imgUrl);
        session.setAttribute("imgUrl",imgUrl);
        int i = pictureService.addPicture(imgUrl);
        JSONObject json = new JSONObject();
        if(i==1){
            json.put("msg","success");
        }else{
            json.put("msg","error");
        }
        return json.toJSONString();
    }


    @RequestMapping(value = "/fileUpload1",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String fileUpload1(MultipartFile file, Map<String,Object> map, HttpSession session) throws IOException {
        byte[] bytes = file.getBytes();
        //构造一个带指定Zone对象的配置类
        Configuration configuration = new Configuration(Zone.zone0());
        UploadManager uploadManager = new UploadManager(configuration);
        System.out.println("accessKey = " + accessKey);
        System.out.println("secretKey = " + secretKey);
        //生成上传凭证，然后准备上传
        Auth auth = Auth.create(accessKey, secretKey);
        String uploadToken = auth.uploadToken(bucket);
        //key：如果不设置key，会使用文件内容的hash值作为key
        //同一个文件hash值相同
        Response response = uploadManager.put(bytes, null, uploadToken);
        //获取响应体的字符串
        String bodyString = response.bodyString();
        DefaultPutRet putRet = JSON.parseObject(bodyString, DefaultPutRet.class);
        String imgUrl = domain+putRet.key;
        map.put("imgUrl",imgUrl);
        session.setAttribute("imgUrl",imgUrl);
        JSONObject json = new JSONObject();
        json.put("msg",true);
        return json.toJSONString();
    }

}
