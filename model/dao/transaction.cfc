component accessors="true" persistent="true" {

    property name="id" column="id" fieldtype="id" ormtype="string" generator="uuid";
    property name="transactionDate" ormtype="timestamp";
    property name="transactionType" ormtype="integer";
    property name="shares" ormtype="integer";
    property name="price" ormtype="double";
    property name="commission" ormtype="double";
    property name="notes" ormtype="string" length="500";
    property name="createdOn" ormtype="timestamp";
    property name="modifiedOn" ormtype="timestamp";
    property name="positionID" ormtype="string";

	function list( required string positionID ) {
        var position = entityLoad('position', arguments.positionID, true);
		var transactions = position.getTransaction();
        return transactions;
    }

    function get( required string transactionID ) {
        return entityLoadByPK('transaction', arguments.transactionID);
    }

    function new() {
        return entityNew('transaction');
    }

    function save( required any transaction ) {
        if (structKeyExists(arguments.transaction, "id") && len(arguments.transaction.id)) {
            var newTransaction = get(arguments.transaction.id);
            var positionID = newTransaction.getPositionID();
        }
        else {
            var newTransaction = new();
            var positionID = arguments.transaction.positionID
        }

        try {
	        newTransaction.setTransactionDate(arguments.transaction.purchaseDate);
	        newTransaction.setShares(arguments.transaction.shares);
	        newTransaction.setPrice(arguments.transaction.price);
	        newTransaction.setCommission(arguments.transaction.commission);
	        newTransaction.setNotes(arguments.transaction.notes);
            newTransaction.setPositionID(positionID);
            newTransaction.setCreatedOn(now());
            newTransaction.setModifiedOn(now());

	        entitySave(newTransaction);
	    }
	    catch(any e) {
	    	writeDump(e);
	    	abort;
	    }

        return newTransaction;
    }

    function delete( required string transactionID ) {
        var transaction = entityLoadByPK('transaction', arguments.transactionID);
        entityDelete(transaction);
    }
}