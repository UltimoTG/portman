component accessors="true" persistent="true" {

    property name="id" column="id" fieldtype="id" ormtype="string" generator="uuid";
    property name="transactionDate" required="true" ormtype="timestamp" notnull="true";
    property name="transactionType" required="true" ormtype="integer" notnull="true" default="1";
    property name="shares" required="true" ormtype="integer" notnull="true";
    property name="price" required="true" ormtype="double" notnull="true";
    property name="commission" required="true" ormtype="double" notnull="true" default="0";
    property name="notes" ormtype="string" length="500";
    property name="createdOn" ormtype="timestamp";
    property name="modifiedOn" ormtype="timestamp";
    property name="positionID" required="true" ormtype="string" notnull="true";

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