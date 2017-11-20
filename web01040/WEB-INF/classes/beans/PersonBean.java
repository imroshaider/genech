package beans;
import java.io.Serializable;
public class PersonBean implements Serializable{
	private String name;
	private int age;
	public PersonBean(){
}
public void setName(String name){
	this.name =name;
}
public void setAge(int age){
	this.age =age;
}
public String getName(){
	return name;
}
public int getAge(){
	return age;
}
}
