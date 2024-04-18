class CardsController < ApplicationController
  before_action :set_card, only: %i[ show edit update destroy ]

  before_action :authenticate_user!, except: [ :index, :show ]

  before_action :correct_user, only: [ :show, :edit, :update, :destroy ]

  # GET /cards or /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/1 or /cards/1.json
  def show
    @card = Card.find(params[:id])
  end

  # GET /cards/new
  def new
    #@card = Card.new
    @card = current_user.cards.build
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    #@card = Card.new(card_params)
    @card = current_user.cards.build(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to card_url(@card), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to card_url(@card), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to cards_url, notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

def correct_user
  @card = current_user.cards.find_by(id: params[:id])
  redirect_to cards_path, notice: "Unauthorised Access" if @card.nil?
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:card_name, :collection_name, :description, :image, :user_id)
    end

end
