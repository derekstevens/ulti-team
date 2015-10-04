$("#sidebar-toggle").click(function(e) {
	e.preventDefault();
	$(".navbar-side").toggleClass("collapsed");
	$("#page-wrapper").toggleClass("collapsed");
});


$(function() {
	$('.tooltip-sidebar-toggle, .tooltip-sidebar-logout').tooltip({
		selector: "[data-toggle-tooltip]",
		container: "body"
	});
});