class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid? #入力項目に空のものがあれば入力画面に遷移
      render :new: 
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.reservation_id = current_reservation.id
    if params[:back] || !@reservation.save #戻るボタンを押したときまたは、@reservationが保存されなかったらnewアクションを実行
      render :new and return
    redirect_to root_path
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
