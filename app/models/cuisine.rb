class Cuisine < ActiveRecord::Base
  has_many :restos

  def count_stars
    Resto.where(:cuisine_id => self.id).count
  end
  
end
