class User < ApplicationRecord
  validates :email, presence: true, format: {with: /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/, message: "Please  enter proper email"}
  validates :password, length: {in: 6..20}
  has_many :blog_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
