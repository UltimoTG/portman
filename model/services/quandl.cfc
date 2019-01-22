component accessors="true" {

    private any function getData( required string stockSymbol, date startDate = "#now()-7#", date endDate = "#now()#" ) {
        var symbol = arguments.stockSymbol;
        var quandl_API = "https://www.quandl.com/api/v3/datasets/EOD/";
        var startDate = dateformat(arguments.startDate, "yyyy-mm-dd");
        var endDate = dateformat(arguments.endDate, "yyyy-mm-dd");

        var fullAPIQuery = quandl_API & "#symbol#.json?api_key=#application.quandlKey#&start_date=#startDate#&end_date=#endDate#&order=asc&column_index=4";

        var httpService = new http();
        httpService.setMethod( "get" );
        httpService.setUrl( fullAPIQuery );

        var httpResponse = httpService.send().getPrefix();
        var deSerializedData = deserializeJSON(httpResponse.filecontent);

        return deSerializedData;
    }

    public string function getCurrentPrice( required string stockSymbol, date startDate = "#now()-7#", date endDate = "#now()#") {

        session.stockPrices = {};

        if (!structKeyExists(session.stockPrices, arguments.stockSymbol)) {
            var stockData = getData(arguments.stockSymbol, arguments.startDate, arguments.endDate);
            if (!isNull(stockData) && structKeyExists(stockData, "dataset")) {
                var stockPriceArr = stockData.dataset.data;
                var arrLength = arrayLen(stockPriceArr);
                var stockPrice = stockPriceArr[arrLength][2];
                session.stockPrices["#arguments.stockSymbol#"] = stockPrice;
            }
            else {
                var stockPrice = 0;
            }
        }
        else {
            var stockPrice = session.stockPrices["#arguments.stockSymbol#"];
        }

        return stockPrice;
    }

}