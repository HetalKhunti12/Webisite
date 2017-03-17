module CategoriesHelper

  def profile_type(profile)
    if profile.contact.package.present? and profile.contact.package.id == 4  
      return "Featured" 
    end
  end
end
