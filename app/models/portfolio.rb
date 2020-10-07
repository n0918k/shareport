class Portfolio < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :link
    validates :description
    validates :image
  end
end
