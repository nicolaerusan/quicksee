class ProviderAddress < ActiveRecord::Base
  attr_accessible :qs_longitude, :qs_latitude
  self.table_name = 'provider_address'
  self.primary_key = 'qs_provider_addressID'
  
  alias_attribute :address, :hp_address_line1
  
  belongs_to :provider,  :foreign_key => "qs_providerID"
  
  
end
