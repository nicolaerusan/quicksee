class Provider < ActiveRecord::Base
  self.table_name = 'provider'
  self.primary_key = 'qs_providerID'
  # attr_accessible :title, :body
  has_one :provider_address
end
