# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#  favorite   :boolean
#

class ContactShare < ActiveRecord::Base
  validates :contact_id, :user_id, presence: true

  belongs_to(
  :user)

  belongs_to(
  :contact)
end
