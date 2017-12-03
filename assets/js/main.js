// date picker documentation: https://eonasdan.github.io/bootstrap-datetimepicker/
$( document ).ready(function() {
	$('.datetimepicker').datetimepicker({
		locale: 'en'
	});

	$('#portfolioID').on('change', function() {
		this.form.submit();
	});
});