class Author < ApplicationRecord
  validates :last_name, presence: true
  has_and_belongs_to_many :papers

  def name
    return "#{first_name} #{last_name}"
  end
end
