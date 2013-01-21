class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :hp_last_4_ssn
 
  self.table_name = 'member'
  self.primary_key = 'qs_memberID'
  
  has_one :member_eligibility
  
end
