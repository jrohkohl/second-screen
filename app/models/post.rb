# == Schema Information
#
# Table name: posts
#
#  id             :bigint           not null, primary key
#  comments_count :integer          default(0)
#  title          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Post < ApplicationRecord
  
  has_rich_text :body

  has_many :comments

  validates :body, presence: :true
  validates :title, presence: :true

end
