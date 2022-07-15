/*
* @description: DMLBase is the runtime implementation of the Dml methods. All Object DAO methods will extend this.
*/

public abstract inherited sharing class DMLBase implements DMLInterface {

	public List<Database.SaveResult> insertRecords(List<SObject> newRecords, boolean allOrNothing) {
		List<Database.SaveResult> saveResults = Database.insert(newRecords, allOrNothing);
		return saveResults;
	}

	public List<Database.SaveResult> insertRecords(List<SObject> newRecords, Database.DMLOptions dmlOptions) {
		List<Database.SaveResult> saveResults = Database.insert(newRecords, dmlOptions);
		return saveResults;
	}
		
	public List<Database.SaveResult> updateRecords(List<SObject> records, boolean allOrNothing) {
		List<Database.SaveResult> updateResults = Database.update(records, allOrNothing);
		return updateResults;
	}

	public List<Database.SaveResult> updateRecords(List<SObject> records, Database.DMLOptions dmlOptions) {
		List<Database.SaveResult> updateResults = Database.update(records, dmlOptions);
		return updateResults;
	}

	public List<Database.UpsertResult> upsertRecords(List<SObject> records, boolean allOrNothing) {
		List<Database.UpsertResult> upsertResults = Database.upsert(records, allOrNothing);
		return upsertResults;
	}

	public List<Database.UpsertResult> upsertRecords(List<SObject> records, SObjectField externalIdField, boolean allOrNothing) {
		List<Database.UpsertResult> upsertResults = Database.upsert(records, externalIdField, allOrNothing);
		return upsertResults;
	}

	public List<Database.DeleteResult> deleteRecords(List<SObject> records, boolean allOrNothing) {
		List<Database.DeleteResult> deleteResults = Database.delete(records, allOrNothing);
		return deleteResults;
	}

	public List<Database.DeleteResult> deleteRecords(List<ID> recordIDs, boolean allOrNothing) {
		System.debug('recordIds ' + recordIDs);
		List<Database.DeleteResult> deleteResults = Database.delete(recordIDs, allOrNothing);
		return deleteResults;
	}

	public List<Database.SaveResult> publish(List<SObject> events) {
		List<Database.SaveResult> saveResults =  EventBus.publish(events);
		return saveResults;
	}
	

}

