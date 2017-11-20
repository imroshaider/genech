package mvc.bmi;
import java.io.Serializable;
import java.match.*;
public class BMIBean implements Serializable{
	private String name;
	private double height;
	private double weight;
	private BigDecimal bmi;


public BMIBean(){

	}
	public void setName(String name){
	this.name= name ;

	}
	public String getName(){
	return name;
	}

	public void setHeight(double height){
	this.height= height;
	
	}

	public double getHeight(){
	return height;
	}

	public void setWeight(double weight){
	this.weight= weight;
	
	}

	public double getWeight(){
	return weight;
	}

	public BigDecimal getBMI(){
	return bmi;
	}

	public void calcBMI(){
	bmi = new BigDecimal(weight/(height * height / 10000));
	bmi =bmi.setScale(2,RoundingMode.HALF_UP);
	}

	public String judgeBMI(){
	String bmiType="";
	if(bmi.doubleValue() >=30.0){
	bmiType = "高度肥満型";
	}else if(bmi.doubleValue() >=25.0){
	bmiType = "肥満型";
	}else if (bmi.doubleValue() >=18.5){
	bmiType = "標準型";
	}else{
	bmiType = "やせ型";
	}
	return bmiType;
	}
}
