class Post < ActiveRecord::Base
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { minimum: 6}
  validates :title, presence: true, length: { minimum: 6, maximum: 255}

  def self.search(query)
  	where("title like ?", "%#{query}%")
  end
end
