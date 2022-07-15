/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class AccountHelper {
    public static void getAcounts(){

        Id accId = '0015i000008RUz0AAG';
        AccountDAI accountDAO = (AccountDAI) DAOFactory.getDAO(Account.sObjectType);
        Account accountObj = accountDAO.findAccountByID(accId);
        System.debug('account is ' + accountObj.Name);
    }
}
