<cfoutput>
    <div class="row">
        <div class="col-xs-9 col-sm-9 col-md-10">
            <h1 class="page-header">Portfolios</h1>
        </div>
        <div class="col-xs-3 col-sm-3 col-md-2">
            <a class="btn btn-primary" href="#buildURL('portfolio.new')#" role="button">Add Portfolio</a>
        </div>
    </div>
    <div class="table-responsive">
        <table class="table table-striped table-hover table-condensed">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Created On</th>
                    <th>Modified On</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <cfif arrayLen(rc.portfolioList)>
                    <cfloop array="#rc.portfolioList#" index="i">
                        <tr>
                            <td>
                                <a href="#buildURL(action='position',queryString='portfolioid=#i.getID()#')#">#i.getName()#</a>
                            </td>
                            <td>#i.getDescription()#</td>
                            <td>#dateformat(i.getCreatedOn(),"mm/dd/yyyy")#</td>
                            <td>#dateformat(i.getModifiedOn(),"mm/dd/yyyy")#</td>
                            <td>
                                <a href="#buildURL(action='portfolio.edit',queryString='portfolioid=#i.getID()#')#">Edit</a> | 
                                <a href="#buildURL(action='portfolio.delete',queryString='portfolioid=#i.getID()#')#">Delete</a>
                            </td>
                        </tr>
                    </cfloop>
                <cfelse>
                    <tr>
                        <td colspan="6">No portfolios found</td>
                    </tr>
                </cfif>
            </tbody>
        </table>
    </div>
</cfoutput>