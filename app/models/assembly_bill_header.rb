class AssemblyBillHeader
  include Mongoid::Document
  field :billNumber, type: String
  field :billType, type: String
end