class Comment < ActiveRecord::Base
  belongs_to :user

  belongs_to :contact

  def self.comments_for_user_id(user_id)
    Comment.all.where('comments.user_id = ?', user_id)
  end
end
