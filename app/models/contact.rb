class Contact < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable


  has_many :listings, dependent: :destroy
  accepts_nested_attributes_for :listings
  belongs_to :role
  belongs_to :package
  has_many :reviews

  validates_presence_of :first_name, :work_email, :work_phone, :company, :mobile_phone, :fax, :password, :password_confirmation, :work_country, presence: true , on: :create
  validates :password, confirmation: true
  validates_uniqueness_of :work_email
  has_many :artist_profiles
  has_many :communications, dependent: :destroy
  has_many :contact_payments, dependent: :destroy
  has_many :inquiry_profiles, dependent: :destroy
  has_many :availables, dependent: :destroy
  accepts_nested_attributes_for :contact_payments

  ratyrate_rater
  # ratyrate_rateable 'rating'

  acts_as_messageable

  def name
    work_email
  end

  def mailboxer_email(object)
    work_email
  end
    
  
  #belons_to :artist_service_orders

  # def role
  # 	self.role.name 
  # end

end
