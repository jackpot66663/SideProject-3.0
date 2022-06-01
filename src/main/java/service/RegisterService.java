package service;

import dao.AccountDAO;
import org.apache.log4j.Logger;

public class RegisterService {

    public void createNewAccount(String username,String password){
        AccountDAO account = new AccountDAO();
        account.insertNewAccount(username,password);
    }
}

