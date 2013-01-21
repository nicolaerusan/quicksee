class MemberEligibility < ActiveRecord::Base
  #attr_accessible :qs_classplan_ID
  
  self.table_name = 'member_eligibility'
  
  self.primary_key = 'qs_member_eligibility_ID'
  
  #belongs_to :member, :class_name => 'Member', :foreign_key => 'qs_memberID'
  
  # attr_accessible :title, :body
end
