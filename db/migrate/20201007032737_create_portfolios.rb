class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :name,null: false
      t.string :link,null: false
      t.text :description,null: false
      t.references :user,null: false,foreignkey: true
      t.timestamps
    end
  end
end
