module ContactsHelper
	def nickname(contact)
    if contact.display_name.present?
      return "(" + contact.display_name + ")"
    end
  end
end
