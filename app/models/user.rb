# == Schema Information
#
# Table name: users
#
#  id       :integer          not null, primary key
#  username :string(255)      not null
#

class User < ActiveRecord::Base
  validates :username, uniqueness: true, presence: true

  has_many(
  :contacts)

  has_many :comments

  has_many(
  :contact_shares)

  has_many(
  :shared_contacts,
  :through => :contact_shares,
  :source => :contact)

  has_many(
  :contact_groups)


  def favorite_contacts
    Contact.favorited_contacts_for_user_id(self.id)
  end
end
