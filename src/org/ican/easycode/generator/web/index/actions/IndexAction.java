package org.ican.easycode.generator.web.index.actions;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;

import org.ican.easycode.generator.web.index.service.inter.GenerateCodeService;
import org.json.JSONObject;

import com.gzdec.framework.action.BaseAction;

/**
 * 代码生成首页
 * @author Vin
 */
public class IndexAction extends BaseAction{

	private GenerateCodeService generateCodeService;
	private JSONObject jsonModel;
	private InputStream inputStream;
	
	public InputStream getInputStream() throws Exception {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	public GenerateCodeService getGenerateCodeService() {
		return generateCodeService;
	}

	public void setGenerateCodeService(GenerateCodeService generateCodeService) {
		this.generateCodeService = generateCodeService;
	}

	public JSONObject getJsonModel() {
		return jsonModel;
	}

	public void setJsonModel(JSONObject jsonModel) {
		this.jsonModel = jsonModel;
	}
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6589309131666821264L;
	
	/**
	 * 代码生成首页
	 * @return
	 */
	public String index(){
		return SUCCESS;
	}
	
	/**
	 * 获取元素据
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String getMetaDataResult() throws Exception{
		this.resultMap.put("mdMetaData", this.generateCodeService.loadMDMetaData(this.formMap));
//		try{
//			this.setJsonModel(new JSONObject("" + this.s2sicoderService.loadMDMetaData(this.formMap)));
//		}
//		catch(Exception ex){
//			this.setJsonModel(new JSONObject("{'status' : 'failure'}"));
//			ex.printStackTrace();
//		}
		return SUCCESS;
	}

	/**
	 * 生成代码
	 * @return
	 */
	public String generate(){
		String status = "failure";
		String downloadUrl = "";
		try {
			String mdMetaData = this.formMap.get("mdMetaData");
			if(null == mdMetaData){
				mdMetaData = "{}";
			}
			else{
				mdMetaData =  URLDecoder.decode(mdMetaData,"UTF-8");
			}
			this.formMap.put("mdMetaData", mdMetaData);
			downloadUrl = this.generateCodeService.generate(this.formMap);
			if(null != downloadUrl && !"".equals(downloadUrl.trim()) && !"failure".equals(downloadUrl.trim())){
				status = "success";
			}
		}
		catch (Exception e) {
			status = "failure";
			e.printStackTrace();
		}
		
		try{
			this.setJsonModel(new JSONObject("{'status':'" + status + "','downloadUrl':'" + downloadUrl.replaceAll("\\\\", "/").trim() + "'}"));
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return SUCCESS;
	}	
	
	/**
	 * STRUTS2下载文件 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String download() throws Exception{
		String fileId = this.formMap.get("fileId");
		//TODO get filepath by fielId
		String filepath = fileId;
		File file = new File(filepath);
		this.resultMap.put("filename", file.getName());
		this.setInputStream(new FileInputStream(file));
		//this.getResponse().reset();//importance!
		return SUCCESS;
	}
	
	/**
	 * 以流的形式下载文件
	 * @return
	 * @throws Exception
	 */
	public String downloadZipFile() throws Exception{
		String fileId = this.formMap.get("fileId");
		
		//TODO get filepath by fileId
		String filepath = fileId;
		
		File file = new File(filepath);
		InputStream fis = new BufferedInputStream(new FileInputStream(file));
		byte[] buffer = new byte[fis.available()];
		fis.read(buffer);
		fis.close();
		// 清空response
		this.getResponse().reset();
		this.getResponse().setContentType("application/octet-stream;charset=GBK");
		// 设置response的Header
		this.getResponse().addHeader("Content-Disposition", "attachment;filename=" + file.getName());
		this.getResponse().addHeader("Content-Length", "" + file.length());
		OutputStream toClient = new BufferedOutputStream(this.getResponse().getOutputStream());
		toClient.write(buffer);
		toClient.flush();
		toClient.close();
		this.getResponse().flushBuffer();
		
		return null;
	}
}
