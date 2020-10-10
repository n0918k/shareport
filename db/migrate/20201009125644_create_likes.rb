class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :user,foreignkey: true
      t.references :portfolio,foreignkey: true
      t.timestamps
    end
  end
end
