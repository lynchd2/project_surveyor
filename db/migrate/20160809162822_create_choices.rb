class CreateChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :choices do |t|
      t.string :value
      t.string :choiceable_type
      t.integer :choiceable_id
      t.timestamps
    end
    add_index :choices, [:choiceable_type, :choiceable_id]
  end
end
