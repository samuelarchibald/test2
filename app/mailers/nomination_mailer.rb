class NominationMailer < ActionMailer::Base
	layout 'nomination_mailer'
	default from: "Silicon Beach App Awards <nominations@sbappawards.com>"

	def nomination_receipt nomination
		@nomination = nomination
		mail to: nomination.email, subject: "Thanks for your nomination!"
	end
end