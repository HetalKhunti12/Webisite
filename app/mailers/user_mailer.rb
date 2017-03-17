class UserMailer < ApplicationMailer
	
	def welcome_mailer(user)
		@user = user
		@password = @user.encrypted_password
		mail(to: @user.work_email, subject: "Welcome")
	end

	def admin_mailer(user)
		mail(to: get_to_list, subject: "New Customer Register")
	end

	def profile_added(user)
		mail(to: get_to_list, subject: "New Customer Register")
	end

	def send_reset_password_instructions(contact, token)
		@contact = contact
		@token = token
		mail(to: contact.work_email, subject: "Reset Password")
	end

	def confirmation_instructions(contact, token)
		@contact = contact
		@token = token
		mail(to: contact.work_email, subject: "Confirmation Mail")
	end

	def send_conversations(contact)
		@contact = contact
		@url = communications_url
		mail(to: get_to_list, subject: "Confirmation Mail")
	end

	def booking_change(email,booking,name,book)
		@booking = booking
		@email = email
		@name = name
		@first_name = book.customer_firstname
    @lastname = book.customer_surname
		# @firstname = firstname
		# @lastname = lastname
		mail(to: @email, subject: "Booking Changes")
	end

	def booking_change_status(email,first_name,last_name,status,name)
		@email = email
		@first_name = first_name
		@last_name = last_name
		@status = status
		@name = name
		mail(to: @email, subject: "Booking Changes Status")
	end

	def send_inquiry_email(enquiry)
		email = []
		@enquiry = enquiry
		@enquiry.inquiry_profiles.each do |ip|
			@contact = ip.contact
			email << ip.contact.work_email
		end
		email << get_to_list
		mail(to: email, subject: "New Enquiry")
	end

	def send_change_inquiry_email(enquiry)
		@enquiry = enquiry
		@enquiry.inquiry_profiles.each do |ip|
			@contact = ip.contact
		end
		mail(to: enquiry.email, subject: "Enquiry Change")
	end

	def register_customer(inquiry)
    @po = inquiry
    @token = inquiry.access_token
    @url = "https://pacific-caverns-55878.herokuapp.com/register_customer/#{@token}"
    mail(:to => "#{inquiry.email}" , :subject => "Booking Form")
  end

	def get_to_list
    if Rails.env.development?
      return "itccrails@gmail.com"
    else
      return "praharsh@itconsultingcompany.com.au, itccrails@gmail.com"
    end
  end

end
