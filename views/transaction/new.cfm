<cfoutput>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Add Transaction</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Transaction Form
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <form role="form" action="?action=transaction.save" method="post">
                                <input type="hidden" name="positionID" value="#rc.positionID#">
                                <div class="form-group">
                                    <label>Date</label>
                                    <div class='input-group date datetimepicker'>
                                        <input class="form-control" name="purchaseDate" value="">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Shares</label>
                                    <input class="form-control" name="shares" value="">
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input class="form-control" name="price" value="">
                                </div>
                                <div class="form-group">
                                    <label>Commission</label>
                                    <input class="form-control" name="commission" value="">
                                </div>
                                <div class="form-group">
                                    <label>Notes</label>
                                    <textarea class="form-control" rows="3" name="notes"></textarea>
                                </div>
                                <button type="submit" class="btn btn-default btn-primary">Submit</button>
                                <button type="reset" class="btn btn-default">Reset</button>
                            </form>
                        </div>
                        <!-- /.col-lg-6 (nested) -->
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
<!-- /##page-wrapper -->
</cfoutput>
