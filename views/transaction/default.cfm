<cfoutput>
    <div class="row">
        <div class="col-xs-6 col-sm-6 col-md-8">
            <h1 class="page-header">Transactions</h1>
        </div>
        <div class="col-xs-6 col-sm-6 col-md-4">
            <a class="btn btn-primary" href="#buildURL(action='position.default')#" role="button">Go Back</a>
            <a class="btn btn-primary" href="#buildURL(action='transaction.new', queryString='positionID=#rc.positionID#')#" role="button">Add Transaction</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th>Transaction Date</th>
                    <th>Shares</th>
                    <th>Price Paid</th>
                    <th>Commission</th>
                    <th>Cost</th>
                    <th>Market Value</th>
                    <th>Gain/Loss</th>
                    <th>Gain/Loss %</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfif arrayLen(rc.transactionsList)>
                    <cfloop array="#rc.transactionsList#" index="i">
                        <cfset local.cost = (i.getShares() * i.getPrice()) + i.getCommission() />
                        <cfset local.marketValue = rc.stockPrice * i.getShares() />
                        <cfset local.gain = local.marketValue - local.cost />
                        <cfset local.gainPercent = (local.gain/local.cost) * 100 />
                        <tr>
                            <td>#dateformat(i.getTransactionDate(),"mm/dd/yyyy")#</td>
                            <td>#i.getShares()#</td>
                            <td>#dollarFormat(i.getPrice())#</td>
                            <td>#dollarFormat(i.getCommission())#</td>
                            <td>#dollarFormat(local.cost)#</td>
                            <td>#dollarFormat(local.marketValue)#</td>
                            <td>#dollarFormat(local.gain)#</td>
                            <td>#decimalformat(local.gainPercent)#%</td>
                            <td>
                                <a href="#buildURL(action='transaction.edit',queryString='transactionID=#i.getID()#')#">Edit</a> |
                                <a href="#buildURL(action='transaction.delete',queryString='transactionID=#i.getID()#')#">Delete</a>
                            </td>
                        </tr>
                    </cfloop>
                <cfelse>
                    <tr>
                        <td colspan="6">No transactions found</td>
                    </tr>
                </cfif>
            </tbody>
        </table>
    </div>
</cfoutput>
