class Resto < ActiveRecord::Base
  resourcify
  paginates_per 5
  has_many :stars, dependent: :destroy
  has_many :users, through: :stars
  belongs_to :cuisine

  validates :name, presence: true
  validates :address, presence: true
  validates :contact, presence: true
  validates :cuisine_id, presence: true
  
end
