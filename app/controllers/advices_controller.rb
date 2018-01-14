class AdvicesController < ApplicationController
  before_action :set_advice, only: [:show, :edit, :update, :destroy]

  # GET /advices
  # GET /advices.json
  def index
    @advices = Advice.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
    @advice = Advice.new
  end

  # GET /advices/1
  # GET /advices/1.json
  def show
  end

  # GET /advices/new
  def new
    @advice = Advice.new
  end

  # GET /advices/1/edit
  def edit
  end

  # POST /advices
  # POST /advices.json
  def create

    @advice = Advice.new(advice_params)

    respond_to do |format|
      if @advice.save
@advices = @advice
        format.html { redirect_to @advice, notice: 'تم انشاء نصيحة جديدة' }

        format.json { render :show, status: :created, location: @advice }
        format.js
      else
        format.html { render :new }
        format.json { render json: @advice.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # PATCH/PUT /advices/1
  # PATCH/PUT /advices/1.json
  def update
    respond_to do |format|
      if @advice.update(advice_params)
        format.html { redirect_to @advice, notice: 'Advice was successfully updated.' }
        format.json { render :show, status: :ok, location: @advice }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @advice.errors, status: :unprocessable_entity }
        format.js

      end
    end
  end

  # DELETE /advices/1
  # DELETE /advices/1.json
  def destroy
    @advice.destroy
    respond_to do |format|
      format.html { redirect_to advices_url, notice: 'Advice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advice
      @advice = Advice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advice_params
      params.require(:advice).permit(:title, :details)
    end
end
