class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: { to_table: :users}, index: true

      t.timestamps
    end
  end
end
