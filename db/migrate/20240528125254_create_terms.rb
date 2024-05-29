class CreateTerms < ActiveRecord::Migration[7.1]
  def change
    create_table :terms do |t|
      t.references :product, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end

    add_index :terms, [:date, :product_id], unique: true
    add_index :terms, :date
  end
end
