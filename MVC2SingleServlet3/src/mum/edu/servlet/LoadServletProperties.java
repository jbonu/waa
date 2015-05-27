package mum.edu.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Map;

import mum.edu.controller.Controller;

public class LoadServletProperties {
	
	  public void  loadControllers(String configFile,Map<String, Controller> controllers,Map<String, Controller> dispatchers,Map<String, String> dispatcherMethods) {
			 
		  	SequencedProperties prop = new SequencedProperties();
	    	InputStream input = null;
 	    	try {
	 
 	    		// Use ClassLoader to search all of classpath
	    		input = getClass().getClassLoader().getResourceAsStream(configFile);
//	    		input = LoadServletProperties.class.getResourceAsStream(filename);
	    		if(input==null){
	    	            System.out.println("Unable to find " + configFile);
	    		    return;
	    		}
	 
		    		//load a properties file from class path
		    		prop.load(input);
		 
	 	    		// Enumerate through Controllers, Then Dispatchers,  then DispatcherMethods...
  	    			Controller controller = null;
 	    			
  	    			String type = null;
	    			Enumeration  enumeration = prop.keys();  
	    			while (enumeration.hasMoreElements()) {  
 	    				String key = (String) enumeration.nextElement();  
  
	    				if (prop.get(key).equals("Start")) {
	    					type = key;
	    					continue;
	    				}
	    					
		    		    if (type.equals("Controllers")) {
		    		    	controller = getControllerInstance((String)prop.get(key));
 		    		    	controllers.put(key, controller);
		    		    }
		    		    else if (type.equals("Dispatchers")) {
		    		    	controller = controllers.get((String)prop.get(key));
		    		    	dispatchers.put(key, controller);
		    		    }
		    		    else if (type.equals("Methods")) {
	 	    		    	String temp = (String) prop.get(key);
		    		    	key = key.substring(1);
		    		    	dispatcherMethods.put(key, temp);
		    		    }

	    			}  
	    	} catch (IOException e) {  
	    		   System.out.println(e.getMessage());  
	    	}  
 	        finally{
	        
	        	if(input!=null){
	        		try {
	        				input.close();
					    } catch (IOException e) {
					    	e.printStackTrace();
					  }
	        	}
	        }
	    		    	
  	    	return ;
	  }


 	Controller getControllerInstance(String controllerName) {
 
 		Controller controller = null;
 		
 		try {
 			// using the Reflection API get the class(forName); get the default Constructor; create an instance...
 			//TODO: Looks like Factory [Method} Pattern - Should it be "Formalized"
 			controller = (Controller)  Class.forName(controllerName).getConstructor().newInstance();
 			
 		
 		}
 		catch (Exception e){
	    	e.printStackTrace();
 		}
 		
		return (controller);
 			
 	}
	
}