package mum.edu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mum.edu.domain.Calculator;
import mum.edu.framework.annotation.AutoWired;
import mum.edu.framework.controller.Controller;
import mum.edu.service.CalculatorService;
import mum.edu.validator.CalculatorValidator;

public class CalculatorController implements Controller {

	
	@AutoWired
	CalculatorValidator calculatorValidator;
	
	@AutoWired
	CalculatorService calculatorService;
	
	  public String inputCalc(Calculator calculator)   {		  
	       return  "/WEB-INF/jsp/CalculatorForm.jsp" ;    
	   }
	   
 	  public String handleCalc(Calculator calculator, HttpServletRequest request, 
 				HttpServletResponse response )   {
	  
 		  
 	        List<String> errors = calculatorValidator.validate(calculator);
 	        if (errors.isEmpty()) {
 	        	
			     calculatorService.add(calculator);
 			     calculatorService.mult(calculator);
 			    	        	 
  	            request.setAttribute("calculator", calculator);
 	            return "/WEB-INF/jsp/CalculatorView.jsp";
 	        } else {
 	  
 	            // store errors and calculator in a scope variable for the view
 	            request.setAttribute("errors", errors);
 	            request.setAttribute("calculator", calculator);
 	            return "/WEB-INF/jsp/CalculatorForm.jsp";
 	        }

  	   }
	   
}
