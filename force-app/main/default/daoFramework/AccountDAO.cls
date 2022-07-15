/**
* @Description: Data Access (SOQL queries) for Account object 

*/
public inherited sharing class AccountDAO extends DmlBase implements AccountDAI {

	public List<Account> getAccountsByQueryString(String qryStr){
		return (List<Account>) Database.query(qryStr);
	}

	public Account findAccountByID(Id accId) {
		Account returnAccount;
		if(returnAccount == null) {
			try {
				returnAccount = [SELECT id, Name
								 FROM Account 
								 WHERE Id =: accId
                                 WITH SECURITY_ENFORCED];
			}
			catch(QueryException qe) {
				return null;
			}
		} 
		return returnAccount;
	}
}

