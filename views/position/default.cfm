<cfoutput>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">
            <h1 class="page-header">Positions</h1>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
            <cfif arrayLen(rc.portfolios)>
                <form role="form" class="form-inline" action="?action=position.default" method="post">
                    <div class="form-group">
                        <label for="portfolioID">Portfolio: </label>
                        <select class="form-control medium" name="portfolioID" id="portfolioID">
                            <cfloop array="#rc.portfolios#" index="i">
                                <option value="#i.getID()#" <cfif i.getID() eq rc.portfolioID>selected</cfif>>#i.getName()#</option>
                            </cfloop>
                        </select>
                    </div>
                </form>
            </cfif>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-6">
            <cfif len(rc.portfolioID)>
                <a class="btn btn-primary pull-right" href="#buildURL(action='position.new', queryString='portfolioID=#rc.portfolioID#')#" role="button">Add Position</a>
            </cfif>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12">&nbsp;</div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Symbol</th>
                    <th>Last Price</th>
                    <th>Shares</th>
                    <th>Cost</th>
                    <th>Market Value</th>
                    <th>Gain/Loss</th>
                    <th>Gain/Loss %</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfif arrayLen(rc.positions)>
                    <cfloop array="#rc.positions#" index="i">
                        <tr>
                            <td><a href="#buildURL(action='transaction',queryString='positionID=#i.getID()#')#">#i.getName()#</a></td>
                            <td>#i.getSymbol()#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].stockPrice#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].shares#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].cost#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].marketValue#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].gain#</td>
                            <td>#rc.stockPrices["#i.getSymbol()#"].gainPercent#%</td>
                            <td>
                                <a href="#buildURL(action='position.edit',queryString='positionID=#i.getID()#&portfolioID=#rc.portfolioID#')#">Edit</a> |
                                <a href="#buildURL(action='position.delete',queryString='positionID=#i.getID()#')#">Delete</a>
                            </td>
                        </tr>
                    </cfloop>
                    <tr class="info">
                        <td colspan="4">Portfolio Value: </td>
                        <td>#rc.grandTotals.totalCost#</td>
                        <td>#rc.grandTotals.totalMarketValue#</td>
                        <td>#rc.grandTotals.totalGain#</td>
                        <td>#rc.grandTotals.totalGainPercent#%</td>
                        <td>&nbsp;</td>
                    </tr>
                <cfelse>
                    <tr>
                        <td colspan="6">No positions found</td>
                    </tr>
                </cfif>
            </tbody>
        </table>
    </div>
</cfoutput>
