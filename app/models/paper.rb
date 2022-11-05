class Paper < ApplicationRecord
  validates :title, :venue, :year, presence: true
  validates_numericality_of :year
  has_and_belongs_to_many :authors

end
