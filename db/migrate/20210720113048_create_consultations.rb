class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :price
      t.integer :duration

      t.timestamps
    end
  end
end
