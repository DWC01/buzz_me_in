class AptBuzzersController < ApplicationController
  before_action :set_apt_buzzer, only: [:show, :edit, :update, :destroy]

  # GET /apt_buzzers
  # GET /apt_buzzers.json
  def index
    @apt_buzzers = AptBuzzer.all
  end

  # GET /apt_buzzers/1
  # GET /apt_buzzers/1.json
  def show
  end

  # GET /apt_buzzers/new
  def new
    @apt_buzzer = AptBuzzer.new
  end

  # GET /apt_buzzers/1/edit
  def edit
  end

  # POST /apt_buzzers
  # POST /apt_buzzers.json
  def create
    @apt_buzzer = AptBuzzer.new(apt_buzzer_params)

    respond_to do |format|
      if @apt_buzzer.save
        format.html { redirect_to @apt_buzzer, notice: 'Apt buzzer was successfully created.' }
        format.json { render :show, status: :created, location: @apt_buzzer }
      else
        format.html { render :new }
        format.json { render json: @apt_buzzer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apt_buzzers/1
  # PATCH/PUT /apt_buzzers/1.json
  def update
    respond_to do |format|
      if @apt_buzzer.update(apt_buzzer_params)
        format.html { redirect_to @apt_buzzer, notice: 'Apt buzzer was successfully updated.' }
        format.json { render :show, status: :ok, location: @apt_buzzer }
      else
        format.html { render :edit }
        format.json { render json: @apt_buzzer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apt_buzzers/1
  # DELETE /apt_buzzers/1.json
  def destroy
    @apt_buzzer.destroy
    respond_to do |format|
      format.html { redirect_to apt_buzzers_url, notice: 'Apt buzzer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apt_buzzer
      @apt_buzzer = AptBuzzer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apt_buzzer_params
      params[:apt_buzzer]
    end
end
