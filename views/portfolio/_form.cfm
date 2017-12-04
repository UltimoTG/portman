<cfoutput>
    <div class="form-group">
        <label>Name</label>
        <input class="form-control" name="name" value="#rc.portfolio.getName()#">
    </div>
    <div class="form-group">
        <label>Description</label>
        <textarea class="form-control" rows="3" name="description">#rc.portfolio.getName()#</textarea>
    </div>
    <button type="submit" class="btn btn-default btn-primary">Submit</button>
    <a class="btn btn-default" href="#buildURL('portfolio.default')#">Cancel</a>
</cfoutput>