component accessors="true" persistent="true" {

    property name="id" column="id" fieldtype="id" ormtype="string" generator="uuid";
    property name="symbol" ormtype="string" required="true" length="10" notnull="true";
    property name="name" ormtype="string" required="true" length="100" notnull="true";
    property name="description" ormtype="string" length="500";
    property name="createdOn" ormtype="timestamp";
    property name="modifiedOn" ormtype="timestamp";
    property name="portfolioID" ormtype="string";

    // relationships
    property name="transaction" type="array" fieldtype="one-to-many" cfc="transaction" fkcolumn="positionid";

	function list( required string portfolioID ) {
		var portfolio = entityLoad('portfolio', arguments.portfolioID, true);
        var positions = portfolio.getPosition();
        return positions;
    }

    function get( required string positionID ) {
        return entityLoadByPK('position', arguments.positionID);
    }

    function new() {
        return entityNew('position');
    }

    function save( required any position ) {
        if (structKeyExists(arguments.position, "id") && len(arguments.position.id)) {
            var newPosition = get(arguments.position.id);
        }
        else {
            var newPosition = new();
        }

        try {
	        newPosition.setName(arguments.position.name);
	        newPosition.setSymbol(arguments.position.symbol);
	        newPosition.setDescription(arguments.position.description);
	        newPosition.setPortfolioID(arguments.position.portfolioID);
            newPosition.setCreatedOn(now());
            newPosition.setModifiedOn(now());

	        entitySave(newPosition);
	    }
	    catch(any e) {
	    	writeDump(e);
	    	abort;
	    }

        return newPosition;
    }

    function delete( required string positionID ) {
        var position = entityLoadByPK('position', arguments.positionID);
        entityDelete(position);
    }
}
