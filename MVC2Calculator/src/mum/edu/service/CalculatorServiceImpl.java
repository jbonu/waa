package mum.edu.service;

import mum.edu.domain.Calculator;

 
public class CalculatorServiceImpl implements CalculatorService  {

	
	
	public void add(Calculator calculator){
		calculator.add();
		
		/*
		  if calculator.getSum() <= 0
		  	register debit
		  	notify debit processor
		 */
		return ;
	}
	
	public void mult(Calculator calculator){
		calculator.mult();
		
		/*
		  if calculator.getMult() >  maxLimit
		  	register over budget
		  	notify overflow processor
		 */

		
		return ;
	}
/*	
	public void add(Calculator calculator){
		calculator.setSum(calculator.getAdd1() + calculator.getAdd2());
		return ;
	}
	
	public void mult(Calculator calculator){
		calculator.setProduct(calculator.getMult1()*calculator.getMult2());
		return ;
	}
*/	


}
