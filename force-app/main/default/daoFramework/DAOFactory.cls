/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 07-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class DAOFactory {
	private static Map<String, DMLInterface> daoMap= new Map<String, DmlInterface>();

	//main method for accessing a DAO via an sObjectType
	public static DMLInterface getDAO(sObjectType objType) {
		String objectName = String.valueOf(objType);
		return getDAO(objectName);
	}

	//this method can be called directly only if the DAO doesn't neatly align to an sObject, e.g. dynamic SOQL across many sObjects
	public static DMLInterface getDAO(String daoName) {
		DMLInterface iDao = daoMap.get(daoName);
		if(iDAO == null) {
			String classNameDAO = daoName;
			//work out what the DAO class name should be
			if (classNameDAO.toLowerCase().endsWith('__c')) {
				classNameDAO = classNameDAO.remove('__c');
			}
			else if (classNameDAO.toLowerCase().endsWith('__e')) {
				classNameDAO = classNameDAO.remove('__e');
			}
			if (classNameDAO.contains('_')) {
				classNameDAO = classNameDAO.remove('_');
			}
			classNameDAO = classNameDAO + 'DAO';
			
			

			//instantiate the DAO class based on that name
			Type customType = Type.forName(classNameDAO);
			if(customType==null) {
				throw new DAOFactoryException('No DAO class found called ['+classNameDAO+']');
			}
			iDao = (DMLInterface)customType.newInstance();
			daoMap.put(daoName, iDao);
		}
		return iDAO;
	}

	public class DAOFactoryException extends Exception { }
}
