class Paper < ApplicationRecord
  validates :title, :venue, :year, presence: true
  validates_numericality_of :year
end
