/* 
* @description: DmlInterface describes the four DML methods available to all SObjects.
*/

public interface DMLInterface {
	List<Database.SaveResult> insertRecords(List<SObject> newRecords, boolean allOrNothing);
	List<Database.SaveResult> insertRecords(List<SObject> newRecords, Database.DMLOptions dmlOptions);
	List<Database.SaveResult> updateRecords(List<SObject> records, boolean allOrNothing);
	List<Database.SaveResult> updateRecords(List<SObject> records, Database.DMLOptions dmlOptions);
	List<Database.UpsertResult> upsertRecords(List<SObject> records, boolean allOrNothing);
	List<Database.UpsertResult> upsertRecords(List<SObject> records, SObjectField externalIdField, boolean allOrNothing);
	List<Database.DeleteResult> deleteRecords(List<SObject> records, boolean allOrNothing);
	List<Database.DeleteResult> deleteRecords(List<ID> recordIDs, boolean allOrNothing);   

}
