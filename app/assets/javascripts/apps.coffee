# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





$ ->
	# variables
	AppUrl = false
	clicked = false

	shakeButton = ->
		$('.initial-new-app-button').effect('shake', distance:7, times:3, 500)

	highlightError = (div) ->
		$(div).animate {
		    'borderColor': '#ff0000'
		  }, 500, ->
		    # Animation complete.
	unhighlightError = (div) ->
		$(div).animate {
		    'borderColor': 'inherit'
		  }, 500, ->
		    # Animation complete.

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
		appName = $('.app-name').val()
		appPrice = $('.app-price').val()
		appStore = $('.app-store').val()
		name = $('.app-name')
		price = $('.app-price')
		store = $('.app-store')
		url = $('.app-url')
		if (AppUrl == true) and (clicked == false) and (appName != '') and (appPrice != '') and (appStore != '')
			$('.new-app-button').toggleClass('hidden')
			clicked = true
		else
			shakeButton()
			if (appName == '')
				highlightError(name)
			else
				unhighlightError(name)
			if (appPrice == '')
				highlightError(price)
			else
				unhighlightError(price)
			if (appStore == '')
				highlightError(store)
			else
				unhighlightError(store)
			if (AppUrl == false)
				highlightError(url)
			else
				unhighlightError(url)
			
			