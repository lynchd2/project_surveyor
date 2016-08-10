class MultipleChoice < ApplicationRecord
  belongs_to :survey, optional: true
  has_many :choices, as: :choiceable, dependent: :destroy

  validates :answers, :number_of_choices, numericality: {greater_than: 0}
  validates :question, {presence: true}
  validate :answer_less_choices

  def answer_less_choices
    if answers > number_of_choices
      errors.add(:answers, "cannot be higher than the total choices")
    end
  end
end