class Choice < ApplicationRecord
  belongs_to :choiceable, polymorphic: true, optional: true
end
