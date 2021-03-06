class Legislator
  include Mongoid::Document
  field :house, type: String
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :party, type: String
  field :contact_information, type: String
  field :capital_phone, type: String
  field :district, type: String
  field :room_number, type: String
  field :email, type: String
  field :state, type: String

  def full_name
    [first_name, middle_name, last_name].select { |name|
      name.present?
    }.join(" ")
  end
end