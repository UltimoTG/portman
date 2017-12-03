component accessors="true" extends="baseController" {
    property portfolioService;

    function before( struct rc ) {
        rc.activeClassName = "portfolios";
    }
    
    function default( struct rc ) {
    	rc.portfolioList = getPortfolioService().list();
    }

    function new( struct rc ) {
        rc.newPortfolio = getPortfolioService().new();
    }

    function save( struct rc ) {
    	rc.savedPorfolio = getPortfolioService().save(rc);
        variables.fw.redirect( 'portfolio.default' );
    }

    function edit( struct rc ) {
    	rc.editPortfolio = getPortfolioService().get(rc.portfolioID);
    }

    function delete( struct rc ) {
        rc.deletePortfolio = getPortfolioService().delete(rc.portfolioID);
        variables.fw.redirect( 'portfolio.default' );
    }
}