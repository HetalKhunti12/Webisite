class Card < ActiveRecord::Base
  belongs_to :contact_payment
  has_one :card_transaction
  
  attr_accessor :card_number, :card_verification

  before_create :validate_card

  def purchase
    response = GATEWAY.recurring(price_in_cents, credit_card, purchase_options)
    create_card_transaction(action: "purchase", amount: self.contact_payment.amount, response: response)
    self.profile_id = response.params["ProfileID"] if response.success? 
    response.success?
  end

  def purchase_new
    response = EWAYGATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    create_card_transaction(action: "purchase", amount: self.contact_payment.amount, response: response)
    self.profile_id = response.params["ewaytrxnnumber"] if response.success? 
    response.success?

    # transaction = EwayRapid::Models::Transaction.new
    # transaction.redirect_url = 'http://www.eway.com.au'
    # transaction.cancel_url = 'http://www.eway.com.au'
    # transaction.customer = EwayRapid::Models::Customer.new
    # card_details = EwayRapid::Models::CardDetails.new
    # name = self.first_name + " " + self.last_name
    # card_details.name = name
    # card_details.number = self.card_number
    # card_details.expiry_month = self.card_expires_on.month
    # card_details.expiry_year = self.card_expires_on.year
    # card_details.cvn = self.card_verification
    
    # transaction.customer.card_details = card_details

    # payment_details = EwayRapid::Models::PaymentDetails.new
    # payment_details.total_amount = self.contact_payment.amount.to_i * 100
    # transaction.payment_details = payment_details

    # transaction.transaction_type = EwayRapid::Enums::TransactionType::PURCHASE

    # response = CLIENT.create_transaction(EwayRapid::Enums::PaymentMethod::DIRECT, transaction)
    # response.card_transaction.status?
  end


  def price_in_cents
    (self.contact_payment.amount * 100).round
  end

  
  private

  def purchase_options
    values = {
            ip: ip_address,
            billing_address: {
                name:      "Flaying Cakes",
                address1:  "123 5th Av.",
                city:      "New York",
                state:     "NY",
                country:   "US",
                zip:       "10001"
            }
        }
    values.merge(
      period: "Month",
      frequency: 1,
      cycles: 12,
      description: "Checking recurring auto-renewal",
      start_date: Time.now
    )
  end

  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add :base, message
      end
    end
  end

  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        brand:               card_type,
        number:              card_number,
        verification_value:  card_verification,
        month:               card_expires_on.month,
        year:                card_expires_on.year,
        first_name:          first_name,
        last_name:           last_name
    )
  end

  

end
