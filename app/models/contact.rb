# == Schema Information
#
# Table name: contacts
#
#  id       :integer          not null, primary key
#  name     :string(255)      not null
#  email    :string(255)      not null
#  user_id  :integer          not null
#  favorite :boolean
#

class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validates :email, :user_id, uniqueness: true

  belongs_to(
  :user)

  has_many :comments

  #join table
  has_many(
  :contacts_group_joins)

  has_many(
  :contact_groups,
  :through => :contacts_group_joins)

  has_one(
  :contact_share)

  has_many(
  :shared_users,
  :through => :contact_share,
  :source => :user)

  def self.contacts_for_user_id(user_id)
    self.all.includes(:contact_share)
    .where("contacts.user_id = #{user_id} OR contact_shares.user_id = #{user_id}")
  end

end
