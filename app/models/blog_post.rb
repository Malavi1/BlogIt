class BlogPost < ApplicationRecord
    self.per_page = 2
    has_rich_text :body
    belongs_to :user
    has_many :comments, dependent: :destroy
    validates :title, :body, presence: true, length: {minimum: 5}
end
