component accessors="true" extends="baseController" {
    property transactionService;
    property positionService;
    property quandlService;

    function before( struct rc ) {
        rc.activeClassName = "transactions";
    }
    
    function default( struct rc ) {
    	rc.transactionsList = getTransactionService().list(rc.positionID);

    	var position = getPositionService().get(rc.positionID);
    	var stockSymbol = position.getSymbol();
		var stockPrice = getQuandlService().getCurrentPrice(stockSymbol);

        rc.stockPrice = stockPrice;
    }

    function save( struct rc ) {
    	rc.transaction = getTransactionService().save(rc);
        variables.fw.redirect( action='transaction.default', queryString="positionID=#rc.transaction.getPositionID()#" );
    }

    function new( struct rc ) {
        rc.transaction = getTransactionService().new();
    }

    function edit( struct rc ) {
        rc.positionID = getTransactionService().get(rc.transactionID).getPositionID();
    	rc.transaction = getTransactionService().get(rc.transactionID);
    }

    function delete( struct rc ) {
        var positionID = getTransactionService().get(rc.transactionID).getPositionID();
        rc.transaction = getTransactionService().delete(rc.transactionID);
        variables.fw.redirect( action='transaction.default', queryString="positionID=#positionID#" );
    }
}