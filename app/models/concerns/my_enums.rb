module MyEnums
  extend ActiveSupport::Concern

  included do
    enum categories: [:entertainer, :musician_or_band, :celebrity, :speaker, :service]
    enum salutations: [:mr, :miss, :ms, :mrs, :dr]
    enum contact_types: [:artist, :service_provider, :agent, :basic_contact, :other]
    enum event_types: [:birthday, :christmas_function, :corporate, :cultural, :educational, :exhibition, :festival, :fund_raiser, :large_public_event, :private_function, :product_launch, :promotions, :stage_show, :trade_show, :wedding, :other_event]
    enum payment_types: [:direct_bank_transfer, :credit_card, :cheque, :amex, :cash_on_delivery]
    enum venue_type: [ :business_address,  :corporate_setting, :function_room, :hall, :hotel, :hotel_function_room, :indoor_stage, :outdoor_stage, :outdoor_open,  :private_dwelling, :public_location , :shopping_centre, :shopping_centres, :other_venue]
    enum birthdays: ['1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th', '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '21st', '25th', '30th', '40th', '50th', '60th', '70th', '80th', '90th', '100th']
    enum account_transfer_types: ['Trust to Savings', 'Savings to Trust']
  end
  
end