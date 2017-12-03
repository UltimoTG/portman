component accessors="true" {
    
    variables.portfolioDAO = new model.dao.portfolio();

	function list() {
        return portfolioDAO.list();
    }

    function get( required string portfolioID ) {
        return portfolioDAO.get(arguments.portfolioID);
    }

    function new() {
        return portfolioDAO.new();
    }

    function save( required any portfolio ) {
        portfolioDAO.save(portfolio);
    }

    function delete( required string portfolioID ) {
        portfolioDAO.delete(arguments.portfolioID);
    }
}