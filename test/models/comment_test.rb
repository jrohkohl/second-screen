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
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
