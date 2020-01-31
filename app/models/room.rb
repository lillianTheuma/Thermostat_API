class Room < ApplicationRecord
  has_many :temperatures, dependent: :destroy
  belongs_to :home


  scope :search, -> (name) {where("name like ?", "%#{name}%")}
end
