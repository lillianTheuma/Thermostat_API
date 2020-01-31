class Temperature > ApplicationRecord
  belongs_to :room

  validates :temperature, presence: true
end
