package mvc.minishop;
import java.io.Serializable;
public class ItemBean implements Serializable {
	private int  ident;
	private String name;
	private String maker;
	private int   price;
	private String image;
	private String genre;
	private int 	quantity;

public ItemBean(){
	
}
public void setIdent(int ident){
	this.ident=ident;
}
public int getIdent(){
	return ident;
}

public void setName(String name){
	this.name=name;
}
public String getName(){
	return name;
}

public void setMaker(String maker){
	this.maker=maker;
}
public String getMaker(){
	return maker;
}

public void setPrice(int price){
	this.price=price;
}
public int getPrice(){
	return price;
}

public void setImage(String image){
	this.image=image;
}
public String getImage(){
	return image;

}

public void setGenre(String genre){
	this.genre=genre;
}
public String getGenre(){
	return genre;

}
public void setQuantity(int quantity){
	this.quantity=quantity;
}
public int getQuantity(){
	return quantity;
}



}
