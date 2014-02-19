# == Schema Information
#
# Table name: contact_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ContactGroup < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to(
  :user)

  has_many(
  :contacts,
  :through => :contacts_group_joins)

  has_many(
  :contacts_group_joins)

  def self.contact_groups_for_user_id(user_id)
    ContactGroup.all.where(:user_id => user_id)
  end
end
