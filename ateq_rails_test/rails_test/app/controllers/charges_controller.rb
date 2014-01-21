class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json

  def index
    @charges = Charge.all
    @charges_failed =   Charge.where(paid:'false')
    @charges_success =  Charge.where(paid:'true')
    @charges_disputed = Charge.where(paid:'disputed')
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
  end

  # POST /charges
  # POST /charges.json
  def create
      @charge  = Charge.new(paid:"true",amount:params[:charge][:amount].to_i,currency:params[:currency].to_s,refunded: false, customer_id:params[:charge][:customer].to_i)
      if(params[:charge][:amount].to_i < 0)
        redirect_to :back , error: 'Amount is not valid.'
      else
        respond_to do |format|
          if @charge.save
            format.html { redirect_to :root , notice: 'Charge was successfully created.' }
          else
            format.html { render action: 'new' }
            format.json { render json: @charge.errors, status: :unprocessable_entity }
          end
        end
      end

  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:paid, :amount, :currency, :refunded, :customer_id)
    end
end
