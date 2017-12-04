<cfoutput>
	<div class="col-sm-3 col-md-2 sidebar">
      <ul class="nav nav-sidebar">
        <li <cfif rc.activeClassName eq "overview">class="active"</cfif>>
          <a href="#buildURL('main')#">Overview <span class="sr-only">(current)</span></a>
        </li>
        <li <cfif rc.activeClassName eq "portfolios">class="active"</cfif>>
          <a href="#buildURL('portfolio')#">Portfolios</a>
        </li>
        <li <cfif listFindNoCase("positions,transactions", rc.activeClassName)>class="active"</cfif>>
          <a href="#buildURL('position')#">Positions</a>
        </li>
      </ul>
    </div>
</cfoutput>