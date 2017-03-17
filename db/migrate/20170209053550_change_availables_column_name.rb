class ChangeAvailablesColumnName < ActiveRecord::Migration
  def change
    rename_column :availables, :contact_id, :artist_profile_id
  end
end
