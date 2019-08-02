package org.ican.easycode.generator.web.index.service.impl;

import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.ican.easycode.generator.common.util.Constants;
import org.ican.easycode.generator.common.factory.GeneratorSimpleFactory;
import org.ican.easycode.generator.common.generator.Generator;
import org.ican.easycode.generator.common.model.MDColumn;
import org.ican.easycode.generator.common.model.MDMetaData;
import org.ican.easycode.generator.common.model.MDPrimaryKey;
import org.ican.easycode.generator.common.model.MDTable;
import org.ican.easycode.generator.common.util.JSONUtil;
import org.ican.easycode.generator.common.util.MDQueryRunner;
import org.ican.easycode.generator.common.util.MDTableComparator;
import org.ican.easycode.generator.web.index.service.inter.GenerateCodeService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 锟斤拷锟斤拷锟斤拷锟绞碉拷锟斤拷锟�
 * @author Vin
 */
public class GenerateCodeServiceImpl implements GenerateCodeService {
	private static final String[] TYPES = new String[]{"TABLE"};
	private Logger log = Logger.getLogger(GenerateCodeServiceImpl.class);
	
	private MDQueryRunner queryRunner;
	
	public MDQueryRunner getQueryRunner() {
		return queryRunner;
	}

	public void setQueryRunner(MDQueryRunner queryRunner) {
		this.queryRunner = queryRunner;
	}

	public Generator getGenerater(String generator) {
		return GeneratorSimpleFactory.getGenerator(generator);
	}

	/**
	 * 锟斤拷纱锟斤拷锟�
	 * @param valueMap
	 * @return
	 */	
	public String generate(Map<String,String> valueMap) {
		String downloadUrl = "";
		try{
			String jsonMDMetaData = valueMap.get("mdMetaData");
			String _generator = valueMap.get("generator");
			MDMetaData metaDatas = JSONUtil.toMDMetaData(jsonMDMetaData);
			Generator generator = this.getGenerater(_generator);
			generator.setMetaDatas(metaDatas);
			downloadUrl = generator.run();
		}
		catch(Exception ex){
			ex.printStackTrace();
			downloadUrl = "failure";
		}
        return downloadUrl;
    }
	
	/**
	 * 锟斤拷询元锟截撅拷
	 * 锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷拥墓乇锟�
	 * @param valueMap
	 * @return
	 */
	public MDMetaData loadMDMetaData(Map<String, String> valueMap) {
		String driverClassName = valueMap.get("driver");
		String url = valueMap.get("url");
		String username = valueMap.get("username");
		String password = valueMap.get("password");
		String tableNamePattern = valueMap.get("tableNamePattern");
		if(null == tableNamePattern || "".equals(tableNamePattern.trim())){
			tableNamePattern = "%";
		}
		MDMetaData mdMetaData = new MDMetaData();
		try {
			this.queryRunner.setDriverClassName(driverClassName);
			this.queryRunner.setUrl(url);
			this.queryRunner.setUsername(username);
			this.queryRunner.setPassword(password);
			
			List<MDTable> tables = this.queryRunner.getTables(tableNamePattern.toUpperCase(),TYPES);
			
			for(MDTable table : tables){
				String tableName = table.getTableName();
				table.setColumns(queryRunner.getColumns(tableName,null));
				table.setPrimaryKeys(queryRunner.getPrimaryKeys(tableName));
				String primaryKey = "";
				for(int i = 0; i < table.getPrimaryKeys().size(); i++){
					MDPrimaryKey mdPrimaryKey = table.getPrimaryKeys().get(i);
					if(i > 0){
						primaryKey += ",";
					}
					primaryKey += mdPrimaryKey.getColumnName();
				}
				table.setPrimaryKey(primaryKey);
				
				String[] primaryKeys = primaryKey.split(",");
				for(int i = 0; i < table.getColumns().size(); i++){
					MDColumn mdColumn = table.getColumns().get(i);
					String columnName = mdColumn.getColumnName();
					for(String key : primaryKeys){
						if(key.equals(columnName)){
							mdColumn.setPrimaryKey(true);
						}
					}
				}
			}
			
			Collections.sort(tables,new MDTableComparator());
			
			mdMetaData.setTables(tables);
			
			mdMetaData.setDbName(Constants.DB_DRIVE_NAME_MAPPINGS.get(driverClassName));
			
			this.queryRunner.clear();
			log.info("queryRunner clear...");
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		log.debug("mdMetaData : " + mdMetaData);
		
		return mdMetaData;
	}
	
	public static void main(String[] args) throws Exception{
//		String filepath = "E:/projects/temp/nes2021548644";
//		String dir = filepath.substring(0, filepath.lastIndexOf("/"));
//		String fileName = filepath.substring(filepath.lastIndexOf("/") + 1);
//		System.out.println("filepath : " + filepath);
//		System.out.println("dir : " + dir);
//		System.out.println("fileName : " + fileName);
		ApplicationContext cx = new ClassPathXmlApplicationContext("spring/easycode-generatecode.xml");
		GenerateCodeService generateCodeService = (GenerateCodeService)cx.getBean("generateCodeService");
		//TODO 使锟斤拷Spring beans锟斤拷式锟斤拷取s
		Map<String, String> valueMap = new java.util.HashMap<String, String>();
		String driverClassName = "org.apache.derby.jdbc.ClientDriver";
		String url = "jdbc:derby://localhost:1527/easycode;create=true";
		String username = "easycode";
		String password = "888888";
		String tableNamePattern = "cms_CON%";
		
		driverClassName = "oracle.jdbc.OracleDriver";
		url = "jdbc:oracle:thin:@172.16.146.3:1521:gzdec";
		username = "base_hlms";
		password = "password";
		tableNamePattern = "%";
		
		driverClassName = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/mysql";
		username = "root";
		password = "888888";
		tableNamePattern = null;
		
//		driverClassName = "com.mysql.jdbc.Driver";
//		url = "jdbc:mysql://172.16.146.69:3306/base_sales";
//		username = "root";
//		password = "root";
//		tableNamePattern = null;
		
		
//		driverClassName = "oracle.jdbc.OracleDriver";
//		url = "jdbc:oracle:thin:@172.16.172.182:1521:develop";
//		username = "hlms2";
//		password = "develop";
		valueMap.put("driver", driverClassName);
		valueMap.put("url", url);
		valueMap.put("username", username);
		valueMap.put("password", password);
		valueMap.put("tableNamePattern", tableNamePattern);
		MDMetaData mdMetaData = generateCodeService.loadMDMetaData(valueMap);
		List<MDTable> tables = mdMetaData.getTables();
		for(MDTable table : tables){
			System.out.println("TableName 锟斤拷 " + table.getTableName());
		}
		
//		MDQueryRunner queryRunner = new MDQueryRunner(driverClassName,url,username,password);
//		java.sql.ResultSet rs = queryRunner.getDatabaseMetaData().getSchemas();
//		java.sql.ResultSet rs1 = null;
//        while(rs.next()) {
//        	String schema = rs.getString(1);
//            if("HLMS2".equals(schema)){
//	          rs1 = queryRunner.getDatabaseMetaData().getTables(null,rs.getString(1),"%",null);
//	          while(rs1.next()) {
//	            System.out.println("   "+ rs1.getString(3)+" : "+rs1.getString(4));
//	          }
//            }
//        }        

	}	
}
