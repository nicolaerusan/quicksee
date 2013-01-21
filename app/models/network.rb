class Network < ActiveRecord::Base
  # attr_accessible :title, :body
    self.table_name = 'network'
    self.primary_key = 'qs_networkID'
    
    has_and_belongs_to_many :providers, :foreign_key => 'qs_networkID', :association_foreign_key => 'qs_providerID', :join_table => "network_provider"

end
