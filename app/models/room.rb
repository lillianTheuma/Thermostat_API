class Room < ApplicationRecord
  has_many :temperatures, dependent: :destroy
  belongs_to :home
  validates :name, presence: true
  validates :temp_setting, presence: true

  scope :search, -> (name) {where("name like ?", "%#{name}%")} # unused
end
