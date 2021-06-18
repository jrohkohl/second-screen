# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#  parent_id  :bigint
#  post_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_owner_id   (owner_id)
#  index_comments_on_parent_id  (parent_id)
#  index_comments_on_post_id    (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#  fk_rails_...  (parent_id => comments.id)
#  fk_rails_...  (post_id => posts.id)
#
class Comment < ApplicationRecord
  has_rich_text :content
  
  belongs_to :post, counter_cache: true
  belongs_to :owner, class_name: "User", counter_cache: true
  belongs_to :parent, class_name: "Comment", optional: true

  has_many :replies, class_name: "Comment", foreign_key: :parent_id, dependent: :destroy

  validates :body, presence: true

  scope :by_posted_date, -> { order(created_at: :desc) }
  scope :by_reply_count, -> { order(replies.count :desc) }
  scope :parent_comments, -> { where(:parent_id => nil) }
  scope :child_comments, -> { where.not(:parent_id => nil) }

end
