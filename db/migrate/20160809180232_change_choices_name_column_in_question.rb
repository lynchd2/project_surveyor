class ChangeChoicesNameColumnInQuestion < ActiveRecord::Migration[5.0]
  def change
    remove_column :multiple_choices, :choices
    add_column :multiple_choices, :number_of_choices, :integer
  end
end
