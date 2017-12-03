component accessors="true" persistent="true" {

    property name="id" column="id" fieldtype="id" ormtype="string" generator="uuid";
    property name="name" ormtype="string" length="200";
    property name="description" ormtype="string" length="500";
    property name="createdOn" ormtype="timestamp";
    property name="modifiedOn" ormtype="timestamp";

    // relationships
    property name="position" type="array" fieldtype="one-to-many" cfc="position" fkcolumn="portfolioid";

	function list() {
        return entityLoad('portfolio');
    }

    function get( required string portfolioID ) {
        return entityLoadByPK('portfolio', arguments.portfolioID);
    }

    function new() {
        return entityNew('portfolio');
    }

    function save( required any portfolio ) {
        if (structKeyExists(arguments.portfolio, "id") && len(arguments.portfolio.id)) {
            var newPortfolio = get(arguments.portfolio.id);
        }
        else {
            var newPortfolio = new();
        }

        newPortfolio.setName(arguments.portfolio.name);
        newPortfolio.setDescription(arguments.portfolio.description);

        entitySave(newPortfolio);
    }

    function delete( required string portfolioID ) {
        var portfolio = entityLoadByPK('portfolio', arguments.portfolioID);
        entityDelete(portfolio);
    }
}