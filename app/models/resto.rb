class Resto < ActiveRecord::Base

  paginates_per 5
  has_many :stars, dependent: :destroy
  has_many :users, through: :stars
  belongs_to :cuisine
  
end
