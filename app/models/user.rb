class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :stars, dependent: :destroy
         has_many :restos, through: :stars
         
         def star!(resto)
          self.stars.create!(resto_id: resto.id)
        end
        
        # destroys a star with matching resto_id and user_id
        def unstar!(resto)
          star = self.stars.find_by_resto_id(resto.id)
          star.destroy!
        end
        
        # returns true of false if a resto is stared by user
        def star?(resto)
          self.stars.find_by_resto_id(resto.id)
        end
        
end
