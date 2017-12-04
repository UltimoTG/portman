<cfoutput>
    <div class="form-group">
        <label>Symbol</label>
        <input class="form-control" name="symbol" value="#rc.position.getSymbol()#">
    </div>
    <div class="form-group">
        <label>Name</label>
        <input class="form-control" name="name" value="#rc.position.getName()#">
    </div>
    <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" rows="3" name="description">#rc.position.getDescription()#</textarea>
    </div>
    <button type="submit" class="btn btn-default btn-primary">Submit</button>
    <a href="#buildURL('position.default')#" class="btn btn-default">Cancel</a>
</cfoutput>