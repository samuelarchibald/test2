check_email = (email) ->
	re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
	return re.test(email)

password_has_value = (password) ->
	if password.val() == ''
		return false
	else
		return true

animate_div_height = (div, height) ->
	div.animate {
		    height: height
		  }, 500, ->



log_in = ->
	#variables
	log_in_button = $('.log-in-button')
	new_user_form = $('.new_user')
	log_in_password = $('.log-in-password')

	log_in_password.keypress (event) ->
		if event.which == 13
		  email = $('.log-in-email')
		  email_form_value = email.val()
		  if check_email(email_form_value)
		  	new_user_form.submit()
		  else
		  	alert('not a valid email')


	#functionality
	log_in_button.click ->
		email = $('.log-in-email')
		email_form_value = email.val()
		if check_email(email_form_value)
			new_user_form.submit()
		else
			alert('not a valid email')




edit_account = ->
	open = false
	attempted_submit = false

	new_password_button = $('.new-password-button')
	updates_confirm_button = $('.updates-confirm')
	edit_user_form = $('.edit_user')
	confirm_password_input = $('.current-password')

	new_password_button.click ->
		new_password_container = $('.new-password')
		if (!open)
			animate_div_height(new_password_container, 150)
			open = true
		else
			animate_div_height(new_password_container, 35)
			open = false


	updates_confirm_button.click ->
		if (!attempted_submit)
			animate_div_height(confirm_password_input, 70)
			attempted_submit = true
			confirm_password_input.keypress (event) ->
				if event.which == 13
					event.preventDefault()
					edit_user_form.submit()
		else
			edit_user_form.submit()

sign_up = ->
	$('.sign_up_button').click ->
		$('.new_user').submit();
	$('.sign_up_confirmation').keypress (event) ->
		if event.which == 13
			event.preventDefault()
			$('.new_user').submit();



$ ->
	log_in()
	edit_account()
	sign_up()

	