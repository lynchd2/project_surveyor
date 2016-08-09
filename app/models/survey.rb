class Survey < ApplicationRecord
  has_many :multiple_choices, dependent: :destroy
  has_many :number_ranges, dependent: :destroy

  accepts_nested_attributes_for :multiple_choices, :number_ranges
end
