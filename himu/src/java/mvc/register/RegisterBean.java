package mvc.register;
public class RegisterBean {
private String ID;
private String PASS;
private String Mail;


public void setID(String ID) {
this.ID = ID;
}
public String getID() {
return ID;
}
public void setPASS(String PASS) {
this.PASS = PASS;
}

public String getPASS() {
return PASS;
}
public void setMail(String Mail) {
this.Mail = Mail;
}
public String getMail() {
return Mail;
}

    Object get(String userid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}