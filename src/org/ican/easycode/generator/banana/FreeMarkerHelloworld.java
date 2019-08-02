package org.ican.easycode.generator.banana;

import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;

public class FreeMarkerHelloworld {
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args) throws Exception{
		Map root = new HashMap();
		
		Configuration cfg = new Configuration();
		cfg.setClassForTemplateLoading(FreeMarkerHelloworld.class,"templates");
		
		BeansWrapper wrapper = BeansWrapper.getDefaultInstance();
		TemplateHashModel staticModels = wrapper.getStaticModels();
		TemplateModel templateModel = (TemplateModel)staticModels.get("org.apache.commons.lang.StringUtils");
		root.put("StringUtils", templateModel);
		
		/* �����´�����ͨ������һ��Ӧ������������ִ�ж��*/
		/*��ȡ�򴴽�һ��ģ��*/
		Template template = cfg.getTemplate("helloworld.ftl");
		/*����һ������ģ��Create a data model */
		root.put("user", "Big Joe");
		Map latest = new HashMap();
		root.put("latestProduct", latest);
		latest.put("url", "/index.html");
		latest.put("name", "green mouse");
		List<String> seq = new ArrayList<String>();
		seq.add("email");
		seq.add("url");
		seq.add("date");
		seq.add("number");
		seq.add("digits");
		seq.add("spring");
		seq.add("");
		seq.add(null);
		seq.add("summer");
		seq.add("autumn");
		seq.add("other");
		root.put("seq", seq);
		/* �ϲ�����ģ�ͺ�ģ��*/
		Writer out = new OutputStreamWriter(System.out);
		template.process(root, out);
		out.flush();
	}
}
