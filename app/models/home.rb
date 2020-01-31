class Home < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  
end
