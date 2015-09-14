$("#sidebar-toggle").click(function(e) {
	e.preventDefault();
	$(".navbar-side").toggleClass("collapsed");
	$("#page-wrapper").toggleClass("collapsed");
});

$(function() {
	$('#messageScroll, #alertScroll').slimScroll({
		height: '200px',
		alwaysVisible: true,
		disableFadeOut: true,
		touchScrollStep: 50
	});
});

$(function() {
	$('.tooltip-sidebar-toggle, .tooltip-sidebar-logout').tooltip({
		selector: "[data-toggle-tooltip]",
		container: "body"
	});
});