class Home < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true

  scope :search_by_name, -> (name) {where("name like ?", "%#{name}%")}
  scope :search_by_address, -> (address) {where("address like ?", "%#{address}%")}
  end
