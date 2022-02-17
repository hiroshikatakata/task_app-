class ReservationsController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @room.days = (@room.end_date - @room.start_date).to_i
    @room.cost = (@room.price).to_i*@room.number*@room.days
    reservation = current_sign.reservations.build(room_id: params[:room_id],start_date: @room.start_date, end_date: @room.end_date, days: @room.days, cost: @room.cost, number: @room.number, icon: @room.icon, introduction: @room.introduction, name: @room.name)
    reservation.save
    flash[:notice] = "予約が完了しました"
    redirect_to controller: :rooms, action: :mycheckroom
  end

  def destroy
    @room = Room.find(params[:id])
  end
end
