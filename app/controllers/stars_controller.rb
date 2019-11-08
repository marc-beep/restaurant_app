class StarsController < ApplicationController

  respond_to :js

def star
  @user = current_user
  @resto = Resto.find(params[:resto_id])
  @user.star!(@resto)
  @star_count = @resto.stars.count
end

def unstar
  @user = current_user
  @star = @user.stars.find_by_resto_id(params[:resto_id])
  @resto = Resto.find(params[:resto_id])
  @star.destroy!
  @star_count = @resto.stars.count
end

end
