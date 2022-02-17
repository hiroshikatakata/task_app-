class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit  reservations update destroy ]

  # GET /rooms or /rooms.json
  def index
    @rooms = Room.all
    @sign = current_sign
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @sign = current_sign
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @sign = current_sign
  end

  # GET /rooms/1/edit
  def edit
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  def reservations
    @room.days = (@room.end_date - @room.start_date).to_i
    @room.cost = (@room.price).to_i*@room.number*@room.days
    @sign = current_sign
  end

  def myroom
    @sign = current_sign
    k = @sign.id
    @rooms = Room.where("sign_id = ?", k)
  end

  def mycheckroom
    @sign = current_sign
    @reservation_rooms = @sign.reservation_rooms
    @reservation = @sign.reservations
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)
    @room.sign_id = current_sign.id
    @sign = current_sign

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    @sign = current_sign
    if @room.number.present?
      @room.days = (@room.end_date - @room.start_date).to_i
      @room.cost = (@room.price).to_i*@room.number*@room.days
    end

      respond_to do |format|
        if @room.update(room_params)
          format.html { redirect_to action: :reservations, notice: "Room was successfully updated." }
          format.json { render :reservations, status: :ok, location: @room }
        else
          format.html { render :show, status: :unprocessable_entity }
          format.json { render json: @room.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    @results = @q.result
    @sign = current_sign
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :introduction, :price, :address, :icon, :start_date, :end_date, :number, :cost, :confirm)
    end
end
