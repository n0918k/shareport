class Portfolio < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  with_options presence: true do
    validates :name
    validates :link
    validates :description
    validates :image
  end
end
