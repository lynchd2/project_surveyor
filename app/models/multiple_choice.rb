class MultipleChoice < ApplicationRecord
  belongs_to :survey, optional: true
  has_many :choices, as: :choiceable, dependent: :destroy

  validates :answers, :number_of_choices, numericality: {greater_than: 0}
  validates :question, {presence: true}
end