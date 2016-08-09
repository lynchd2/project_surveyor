class CreateMultipleChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_choices do |t|
      t.references :survey, index: true
      t.boolean :required, default: true
      t.string :question
      t.integer :choices
      t.integer :answers
      t.timestamps
    end
  end
end
