class AddLikesCountToPortfolios < ActiveRecord::Migration[6.0]
  def change
    add_column :portfolios, :likes_count, :integer
  end
end
