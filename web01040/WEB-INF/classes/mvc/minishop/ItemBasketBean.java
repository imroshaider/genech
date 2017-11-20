package mvc.minishop;
import java.io.Serializable;
import java.util.*;


public class ItemBasketBean implements Serializable{

	private List<ItemBean> basket = new ArrayList<ItemBean>();


	public 	ItemBasketBean(){

	}

	public void setBasket(ItemBean itemBean, int quantity ){
		itemBean.setQuantity(quantity);
		basket.add(itemBean);
	}

	public List<ItemBean> getBasket(){
		return basket;
	}

	public int getSize(){
		return basket.size();

	}

	public ItemBean getItem(int n){
		return basket.get(n);
	}

	public int getItemQuantity(int n){
		return getItem(n).getQuantity();
	}

	public int getTotal(int n){
		return (getItem(n).getPrice() * getItem(n).getQuantity());
	}

	public int getSum(){
		int sum = 0;
		for(int i=0; i<this.getSize();i++){
			sum +=this.getTotal(i);
		}
		return sum;
	}

	public void deleteItem(int n){
		basket.remove(n);
	}

	public void clearItem(){
		basket.clear();
	}

	public void changeItemQuantity(int n,int newQuantity){
		getItem(n).setQuantity(newQuantity);
	}

}
