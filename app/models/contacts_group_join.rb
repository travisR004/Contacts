class ContactsGroupJoin < ActiveRecord::Base
  belongs_to(
  :contact)

  belongs_to(
  :contact_group)
end