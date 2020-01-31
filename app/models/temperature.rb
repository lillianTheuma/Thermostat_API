class Temperature < ApplicationRecord
  belongs_to :room

  validates :temperature, presence: true


  scope :most_recent, -> { order(created_at: :desc).limit(1)}
  scope :above_setting, -> ( setting ) { where("temperature > ?", "#{setting}")}
  scope :below_setting, -> ( setting) { where("temperature < ?", "#{setting}")}
end
