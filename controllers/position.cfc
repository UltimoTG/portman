component accessors="true" extends="baseController" {
    property positionService;
    property transactionService;
    property portfolioService;
    property quandlService;

    function before( struct rc ) {
        rc.activeClassName = "positions";
    }

    function default( struct rc ) {

        rc.portfolios = getPortfolioService().list();

        if (!structKeyExists(rc, "portfolioID")) {
            rc.portfolioID = rc.portfolios[1].getID();
        }

        rc.positions = getPositionService().list(rc.portfolioID);
        rc.stockPrices = {};
        rc.grandTotals = {};

        var totalCost = 0;
        var totalMarketValue = 0;
        var totalGain = 0;
        var totalGainPercent = 0;

        for (var position in rc.positions) {
            var stockPrice = getQuandlService().getCurrentPrice(position.getSymbol());
            rc.stockPrices["#position.getSymbol()#"] = {}
            rc.stockPrices["#position.getSymbol()#"].stockPrice = stockPrice;

            var transactionsList = getTransactionService().list(position.getID());

            var shares = 0;
            var cost = 0;
            var marketValue = 0;
            var gain = 0;
            var gainPercent = 0;

            for (var transaction in transactionsList) {
                shares = shares + transaction.getShares();
                cost = cost + (transaction.getShares() * transaction.getPrice()) + transaction.getCommission();
                marketValue = marketValue + (stockPrice * transaction.getShares());
            }

            if (cost != 0) {
                gain = marketValue - cost;
                gainPercent = (gain/cost) * 100;
            }

            rc.stockPrices["#position.getSymbol()#"].shares = decimalformat(shares);
            rc.stockPrices["#position.getSymbol()#"].cost = decimalformat(cost);
            rc.stockPrices["#position.getSymbol()#"].marketValue = decimalformat(marketValue);
            rc.stockPrices["#position.getSymbol()#"].gain = decimalformat(gain);
            rc.stockPrices["#position.getSymbol()#"].gainPercent = decimalformat(gainPercent);
            
            totalCost = totalCost + cost;
            totalMarketValue = totalMarketValue + marketValue;
            totalGain = totalGain + gain;
            totalGainPercent = 0;
            if (totalCost GT 0) {
                totalGainPercent = (totalGain/totalCost) * 100;
            }
        }

        rc.grandTotals.totalCost = decimalformat(totalCost);
        rc.grandTotals.totalMarketValue = decimalformat(totalMarketValue);
        rc.grandTotals.totalGain = decimalformat(totalGain);
        rc.grandTotals.totalGainPercent = decimalformat(totalGainPercent);
    }

    function new( struct rc ) {
        rc.newPosition = getPositionService().new();
    }

    function save( struct rc ) {
    	rc.savedPosition = getPositionService().save(rc);
        variables.fw.redirect( action='position.default', queryString="portfolioID=#rc.portfolioID#" );
    }

    function edit( struct rc ) {
    	rc.editPosition = getPositionService().get(rc.positionID);
    }

    function delete( struct rc ) {
        var portfolioID = getPositionService().get(rc.positionID).getportfolioID();
        rc.deletePosition = getPositionService().delete(rc.portfolioID);
        variables.fw.redirect( action='position.default', queryString="portfolioID=#portfolioID#" );
    }
}
