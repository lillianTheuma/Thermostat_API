class Room < ApplicationRecord
  has_many :temperatures, dependent: :destroy
  belongs_to :home

end
