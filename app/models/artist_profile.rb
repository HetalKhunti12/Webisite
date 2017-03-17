class ArtistProfile < ActiveRecord::Base
  is_impressionable 
  
  
  has_many :artist_service_orders, dependent: :destroy
  accepts_nested_attributes_for :artist_service_orders

  has_many :profile_images, dependent: :destroy
  accepts_nested_attributes_for :profile_images

  has_many :profile_contents, dependent: :destroy
  accepts_nested_attributes_for :profile_contents

  has_many :reviews

  has_many :profile_videos, dependent: :destroy
  accepts_nested_attributes_for :profile_videos

  belongs_to :contact

  scope :approved, -> { where(approved: true) }
  
  # ratyrate_rateable "rating"
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

  validates_presence_of :title, :p_profile_type, :category_id, :sub_category_id, :price, :country, presence: true , on: :create
  validates_uniqueness_of :title
  
  has_many :availables
  belongs_to :booking
  belongs_to :category
  
  extend FriendlyId
  # friendly_id :id, use: :slugged
  friendly_id :title, use: :slugged
  
  PRICING = ["$0-$1000","$1000-2000","$2000-$3000","$3000-$4000","$4000-$5000", "$5000 plus", "other" ]
  STATUS = [{"key" => "Approve", "value" => "true"},{"key" => "Decline", "value" => "false"}]
  #PRICING = [{"key" =>"1", "value"=> "$0-$1000"}, {"key" => "2","value" => "$1000-2000"}, {"key" => "3", "value" => "$2000-$3000"}, {"key" => "4","value" => "$3000-$4000"}, { "key" => "5", "value" => "$4000-$5000"}, { "key" => "6", "value" => "$5000 plus" }, {"key" => "7", "value" => "other"}]


  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.search_by_artist_title_keyword_body(query, sub_category, location)
    if query.present? and sub_category.present?
      where("(coalesce(title, '') || ' ' || coalesce(keywords, '') || ' ' || coalesce(short_description, '')  ilike '%' || ? || '%') and  (coalesce(sub_category_id = ?)) ", query,sub_category)
    elsif query.present? and !sub_category.present? and !location.present?
      where("(coalesce(title, '') || ' ' || coalesce(keywords, '') || ' ' || coalesce(short_description, '')  ilike '%' || ? || '%') ", query)
    elsif location.present?
        where("(coalesce(title, '') || ' ' || coalesce(keywords, '') || ' ' || coalesce(short_description, '')  ilike '%' || ? || '%') and  (coalesce(location2 = ?)) ", query,location)
    else
      self.all
    end
  end

  def self.search_by_artist_title_and_keyword_and_body(query)
    if query.present? 
      where("(coalesce(title, '') || ' ' || coalesce(keywords, '') || ' ' || coalesce(short_description, '')  ilike '%' || ? || '%')", query)
    else
      self.all
    end
  end


  def self.search(event)
    if event.present?
      where.not("coalesce(date(availables.start_at) < ? and date(availables.end_at) > ?)", event, event)
    else
      self.all
    end
  end
  
end