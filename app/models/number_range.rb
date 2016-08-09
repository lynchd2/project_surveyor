class NumberRange < ApplicationRecord
  belongs_to :survey, optional: true
  has_many :choices, as: :choiceable, dependent: :destroy

  
  validates :low, :high, numericality: true
  validates :question, {presence: true}
  validate :low_is_lower


  def low_is_lower
    if low && high && (low >= high)
      errors.add(:lowest, "cannot be higher or equal to the highest value")
    end
  end

end
