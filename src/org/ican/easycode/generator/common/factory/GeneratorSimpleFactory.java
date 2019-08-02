package org.ican.easycode.generator.common.factory;

import org.ican.easycode.generator.apple.AppleGenerator;
import org.ican.easycode.generator.banana.BananaGenerator;
import org.ican.easycode.generator.cocoa.CocoaGenerator;
import org.ican.easycode.generator.common.generator.Generator;
import org.ican.easycode.generator.common.util.Constants;
import org.ican.easycode.generator.durian.DurianGenerator;
import org.ican.easycode.generator.emblic.EmblicGenerator;
import org.ican.easycode.generator.fig.FigGenerator;
import org.ican.easycode.generator.grape.GrapeGenerator;
import org.ican.easycode.generator.gzdec.GzdecGenerater;
import org.ican.easycode.generator.haw.HawGenerator;
import org.springframework.beans.factory.FactoryBean;

import freemarker.template.Configuration;

/**
 * Spring FactoryBean And Simple Factory 
 * @author Vin
 *
 */
public class GeneratorSimpleFactory implements FactoryBean{
	private String name;
	
	public void setName(String name) {
		this.name = name;
	}

	public static Generator getGenerator(String generator){
		Generator _generator = null;
		if(Constants.GENERATORS.containsKey(generator)){
			if(Constants.COCOA_GENERATOR.equals(generator)){
				_generator = new CocoaGenerator();
			}
			else if(Constants.BANANA_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(BananaGenerator.class,"templates");
				_generator = new BananaGenerator(configuration);
			}
			else if(Constants.GZDEC_GENERATOR.equals(generator)){
				_generator = new GzdecGenerater();
			}
			else if(Constants.APPLE_GENERATOR.equals(generator)){
				_generator = new AppleGenerator();
			}
			else if(Constants.DURIAN_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(DurianGenerator.class,"templates");
				_generator = new DurianGenerator(configuration);
			}
			else if(Constants.EMBLIC_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(EmblicGenerator.class,"templates");
				_generator = new EmblicGenerator(configuration);
			}
			else if(Constants.FIG_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(FigGenerator.class,"templates");
				_generator = new FigGenerator(configuration);
			}
			else if(Constants.GRAPE_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(GrapeGenerator.class,"templates");
				_generator = new GrapeGenerator(configuration);
			}
			else if(Constants.HAW_GENERATOR.equals(generator)){
				Configuration configuration = new Configuration();
				configuration.setDefaultEncoding(Constants.ENCODING);
				configuration.setClassForTemplateLoading(HawGenerator.class,"templates");
				_generator = new HawGenerator(configuration);
			}			
			
			if(null != _generator){
				_generator.setZip(true);
			}
		}
		return _generator;
	}


	public Object getObject() throws Exception {
		if(null != this.name){
			return getGenerator(this.name);
		}
		return null;
	}

	@SuppressWarnings("rawtypes")
	public Class getObjectType() {
		Class clazz = null;
		if(Constants.GENERATORS.containsKey(this.name)){
			if(Constants.COCOA_GENERATOR.equals(this.name)){
				clazz = CocoaGenerator.class;
			}
			else if(Constants.BANANA_GENERATOR.equals(this.name)){
				clazz = BananaGenerator.class;
			}
			else if(Constants.GZDEC_GENERATOR.equals(this.name)){
				clazz = GzdecGenerater.class;
			}
			
			else if(Constants.APPLE_GENERATOR.equals(this.name)){
				clazz = AppleGenerator.class;
			}
			else if(Constants.DURIAN_GENERATOR.equals(this.name)){
				clazz = DurianGenerator.class;
			}
			else if(Constants.EMBLIC_GENERATOR.equals(this.name)){
				clazz = EmblicGenerator.class;
			}
			
			else if(Constants.FIG_GENERATOR.equals(this.name)){
				clazz = FigGenerator.class;
			}
			else if(Constants.GRAPE_GENERATOR.equals(this.name)){
				clazz = GrapeGenerator.class;
			}
			else if(Constants.HAW_GENERATOR.equals(this.name)){
				clazz = HawGenerator.class;
			}		
		}
		return clazz;
	}

	public boolean isSingleton() {
		return false;
	}
}
