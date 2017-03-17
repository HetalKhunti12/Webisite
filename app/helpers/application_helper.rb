module ApplicationHelper

	def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_name = '<span class="glyphicon glyphicon-plus "></span>' + " " + name
    link_to(link_name.html_safe, '#', class: "add_inquiry_profile btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def link_to_add_artist_profile(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_name = '<span class="glyphicon glyphicon-plus "></span>' + " " + name
    link_to(link_name.html_safe, '#', class: "add_inquiry_profile btn btn-primary", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def increment_by_one(index)
    if index
      return index+1  
    else
      return 1
    end
  end
  
end
