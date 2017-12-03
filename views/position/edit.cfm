<cfoutput>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Edit Position</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Position Form
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-lg-6">
                            <form role="form" action="?action=position.save" method="post">
                                <input type="hidden" name="id" value="#rc.positionID#">
                                <input type="hidden" name="portfolioID" value="#rc.portfolioID#">
                                <div class="form-group">
                                    <label>Name</label>
                                    <input class="form-control" name="name" value="#rc.editPosition.getName()#">
                                </div>
                                <div class="form-group">
                                    <label>Symbol</label>
                                    <input class="form-control" name="symbol" value="#rc.editPosition.getSymbol()#">
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea class="form-control" rows="3" name="description">#rc.editPosition.getDescription()#</textarea>
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
