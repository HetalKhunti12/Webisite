class Inquiry < ActiveRecord::Base
	has_many :inquiry_profiles, dependent: :destroy
  accepts_nested_attributes_for :inquiry_profiles, reject_if: :all_blank

  
  validates_presence_of :email, presence: true , on: :create
  
  has_one :booking

  def access_token
    Inquiry.create_access_token(self)
  end

  # Verifier based on our application secret
  def self.verifier
    ActiveSupport::MessageVerifier.new('secret')
  end

  def self.read_access_token(id)
    id = verifier.verify(id)
    Inquiry.find id
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    nil
  end

  def self.create_access_token(inquiry)
    verifier.generate(inquiry.id)
  end
  
end
