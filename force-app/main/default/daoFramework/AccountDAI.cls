/**
* @Description: Interface that defines all the available Data Access methods (SOQL queries) for Account object 

*/
public interface AccountDAI extends DmlInterface {

	List<Account> 		getAccountsByQueryString(String qryStr);
	Account 			findAccountByID(ID accId);
 
}
