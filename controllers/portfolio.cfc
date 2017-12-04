component accessors="true" extends="baseController" {
    property portfolioService;

    function before( struct rc ) {
        rc.activeClassName = "portfolios";
    }
    
    function default( struct rc ) {
    	rc.portfolioList = getPortfolioService().list();
    }

    function new( struct rc ) {
        rc.portfolio = getPortfolioService().new();
    }

    function save( struct rc ) {
    	rc.savedPorfolio = getPortfolioService().save(rc);
        variables.fw.redirect( 'portfolio.default' );
    }

    function edit( struct rc ) {
    	rc.portfolio = getPortfolioService().get(rc.portfolioID);
    }

    function delete( struct rc ) {
        rc.portfolio = getPortfolioService().delete(rc.portfolioID);
        variables.fw.redirect( 'portfolio.default' );
    }
}