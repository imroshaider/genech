
package mvc;
import static java.lang.System.*;

/**
 *
 * @author imros
 */
public class New {
    String test(){
        
         out.println("<!-- モーダル・ダイアログ --><div class='modal fade' id='Modal_1' tabindex='-1'><div class='modal-dialog'><div class='modal-content'>");
                
                            
                               
                               out.println("<div class='modal-header'><button type='button' class='close' data-dismiss='modal'><span>×</span></button></div>");
                               
                            out.println("<div class='modal-body'><div class='box2'><span class='box-title'>User Name</span>");
                              
                             
                                 out.println("<table class='teble text-left'><!-- thの中にデータいれる -->");
                                out.println("<tr><th>住所:</th><th></th></tr>");
                               out.println(" <tr><th>趣味：</th><th></th></tr>");
                                out.println("<tr><th>過去の訪問：</th><th></th></tr>");
                                out.println("<tr><th>コメント：</th><th></th></tr>");                               
                               out.println("<br></table></div></div>");
                                
                            out.println("<div class='modal-footer'>");
                            out.println("<form method='POST' action='temp.jsp' >");
                             out.println("<input type='hidden' name='uid' value=''>");
                            out.println("<input type='submit' value='提案' class='btn btn-primary'>");
                            return null;
    }
}
