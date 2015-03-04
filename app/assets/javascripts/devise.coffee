

new_user = ->
	#variables
	log_in_button = $('.log-in-button')
	new_user_form = $('.new_user')
	
	#functionality
	log_in_button.click ->
		email = $('.log-in-email')
		email_form_value = email.val()
		if check_email(email_form_value)
			new_user_form.submit()
		else
			alert('not a valid email')


log_in_button_click = (email) ->
	
		


check_email = (email) ->
	re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	return re.test(email)

$ ->
	#check variables and submit form
	new_user()