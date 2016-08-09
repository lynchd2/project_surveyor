class CreateNumberRanges < ActiveRecord::Migration[5.0]
  def change
    create_table :number_ranges do |t|
      t.references :survey, index: true
      t.boolean :required, default: true
      t.integer :low
      t.integer :high
      t.string :question
      t.timestamps
    end
  end
end
