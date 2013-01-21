class Provider < ActiveRecord::Base
  self.table_name = 'provider'
  self.primary_key = 'qs_providerID'
  # attr_accessible :title, :body
  
  has_one :provider_address, :foreign_key => 'qs_providerID'  
  has_and_belongs_to_many :networks, :foreign_key => 'qs_providerID', :association_foreign_key => "qs_networkID", :join_table => "network_provider"

end
