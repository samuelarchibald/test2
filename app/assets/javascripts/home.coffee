# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	alert_div = $('.sam-alert')
	ok_button = $('.sam-alert-ok')

	ok_button.click ->
		alert_div.fadeOut()