# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	# variables
	appName = $('.app-name').val()
	appPrice = $('.app-price').val()
	AppUrl = false
	clicked = false

	$('.app-price').click ->
		$('.app-price-text').animate {
		    opacity: 1,
		    height: 20
		  }, 500, ->
		    # Animation complete.
	$('.app-price').change ->
		$('.app-price-text').animate {
		    opacity: 0,
		    height: 0
		  }, 500, ->
		    # Animation complete.
	$('.app-url').change ->
		url = $('.app-url').val()
		if url
			isurl = url.indexOf("http") > -1
			if isurl
				AppUrl = true
				$('.app-url-text').animate {
				    opacity: 0,
				    height: 0
				  }, 500, ->
			else
				$('.app-url-text').animate {
				    opacity: 1,
				    height: 20
				  }, 500, ->
				    # Animation complete.
		else
			$('.app-url-text').animate {
				    opacity: 0,
				    height: 0
				  }, 500, ->
				    # Animation complete.
	$('.app-description').click ->
		$('.app-description').animate {
			    height: 100
			  }, 500, ->
			    # Animation complete.
	$('.new-app-button').click ->
		if (AppUrl == true) and (clicked == false)
			$('.new-app-button').toggleClass('hidden')
			clicked = true
		elsif (clicked == true)
			#do nothing

			