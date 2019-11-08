class Star < ActiveRecord::Base
  belongs_to :resto

  belongs_to :user

  validates :user_id, uniqueness: { scope: :resto_id }

  
end
