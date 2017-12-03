component accessors="true" {

	variables.positionDAO = new model.dao.position();

	function list( required string portfolioID ) {
        return positionDAO.list(arguments.portfolioID);
    }

    function get( required string positionID ) {
        return positionDAO.get(arguments.positionID);
    }

    function new() {
        return positionDAO.new();
    }

    function save( required any position ) {
        return positionDAO.save(arguments.position);
    }

    function delete( required string positionID ) {
        positionDAO.delete(arguments.positionID);
    }
}