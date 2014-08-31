class BuzzMeAppsController < ApplicationController


  before_action :set_buzz_me_app, only: [:show, :edit, :update, :destroy]

  # GET /buzz_me_apps
  # GET /buzz_me_apps.json
  def index
    @buzz_me_apps = BuzzMeApp.all
  end

  # GET /buzz_me_apps/1
  # GET /buzz_me_apps/1.json
  def show
   @twilio_number    =  @buzz_me_app.twilio_number
   @buzz_in_number   =  @buzz_me_app.buzz_in_number
   @password         =  @buzz_me_app.password

  end

  # GET /buzz_me_apps/new
  def new
    @buzz_me_app = BuzzMeApp.new
  end

  # GET /buzz_me_apps/1/edit
  def edit
  end

  # POST /buzz_me_apps
  # POST /buzz_me_apps.json
  def create
    @buzz_me_app    = BuzzMeApp.new(buzz_me_app_params)


    respond_to do |format|
      if @buzz_me_app.save
        format.html { redirect_to @buzz_me_app, notice: 'Buzz me app was successfully created.' }
        format.json { render :show, status: :created, location: @buzz_me_app }

      else
        format.html { render :new }
        format.json { render json: @buzz_me_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buzz_me_apps/1
  # PATCH/PUT /buzz_me_apps/1.json
  def update
    respond_to do |format|
      if @buzz_me_app.update(buzz_me_app_params)
        format.html { redirect_to @buzz_me_app, notice: 'Buzz me app was successfully updated.' }
        format.json { render :show, status: :ok, location: @buzz_me_app }
      else
        format.html { render :edit }
        format.json { render json: @buzz_me_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buzz_me_apps/1
  # DELETE /buzz_me_apps/1.json
  def destroy
    @buzz_me_app.destroy
    respond_to do |format|
      format.html { redirect_to buzz_me_apps_url, notice: 'Buzz me app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buzz_me_app
      @buzz_me_app = BuzzMeApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def buzz_me_app_params
     params.require(:buzz_me_app).permit(:twilio_number,:buzz_in_number, :password) 
      
    end
end
