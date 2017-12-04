<cfoutput>
    <div class="form-group">
        <label>Date</label>
        <div class='input-group date datetimepicker'>
            <input class="form-control" name="purchaseDate" value="#dateformat(rc.transaction.getTransactionDate(),'mm/dd/yyyy')#">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
            </span>
        </div>
    </div>
    <div class="form-group">
        <label>Shares</label>
        <input class="form-control" name="shares" value="#rc.transaction.getShares()#">
    </div>
    <div class="form-group">
        <label>Price</label>
        <input class="form-control" name="price" value="#rc.transaction.getPrice()#">
    </div>
    <div class="form-group">
        <label>Commission</label>
        <input class="form-control" name="commission" value="#rc.transaction.getCommission()#">
    </div>
    <div class="form-group">
        <label>Notes</label>
        <textarea class="form-control" rows="3" name="notes">#rc.transaction.getNotes()#</textarea>
    </div>
</cfoutput>