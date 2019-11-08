class RestosController < ApplicationController
  before_action :set_resto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, ]

  # GET /restos
  # GET /restos.json
  def index
    if params[:cuisine]. blank?
    @restos = Resto.includes(:stars).order(created_at: :desc).page params[:page]
    else
      @cuisine_id = Cuisine.find_by(name: params[:cuisine]).id
      @restos = Resto.where(cuisine_id: @cuisine_id).order("created_at DESC").page params[:page]
    end
  end

  # GET /restos/1
  # GET /restos/1.json
  def show
    @resto = Resto.find_by_id(params[:id])
    @star_count = @resto.stars.count
  end

  # GET /restos/new
  def new
    @resto = Resto.new
  end

  # GET /restos/1/edit
  def edit
  end

  # POST /restos
  # POST /restos.json
  def create
    @resto = Resto.new(resto_params)

    respond_to do |format|
      if @resto.save
        format.html { redirect_to @resto, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @resto }
      else
        format.html { render :new }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restos/1
  # PATCH/PUT /restos/1.json
  def update
    respond_to do |format|
      if @resto.update(resto_params)
        format.html { redirect_to @resto, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @resto }
      else
        format.html { render :edit }
        format.json { render json: @resto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restos/1
  # DELETE /restos/1.json
  def destroy
    @resto.destroy
    respond_to do |format|
      format.html { redirect_to restos_url, notice: 'Entry was deleted.' }
      format.json { head :no_content }
    end
  end

  def most_popular
    @restos = Resto.joins('LEFT JOIN (select resto_id, count(*) as star_count from stars group by resto_id) as stars on restos.id = stars.resto_id').order('star_count desc').page params[:page]
    render 'index'
  end

  def starred_restos
    @user = current_user.id
    @restos = Resto.joins(:users).where("user_id = " +  @user.to_s ).page params[:page]
    render 'index'
  end

    def random
     @restos = Resto.order("RANDOM()").take(3)
     render 'index'
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resto
      @resto = Resto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resto_params
      params.require(:resto).permit(:name, :address, :contact, :cuisine_id)
    end
    
end
