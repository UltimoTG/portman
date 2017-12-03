component accessors="true" {
    
    variables.transactionDAO = new model.dao.transaction();

	function list(required string positionID) {
        return transactionDAO.list(arguments.positionID);
    }

    function get( required string transactionID ) {
        return transactionDAO.get(arguments.transactionID);
    }

    function new() {
        return transactionDAO.new();
    }

    function save( required any transaction ) {
        return transactionDAO.save(transaction);
    }

    function delete( required string transactionID ) {
        transactionDAO.delete(arguments.transactionID);
    }
}