class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :image))
    if @room.save
      flash[:notice] = "施設の新規登録を完了しました。"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(params.require(:room).permit(:name, :introduction, :price, :address, :image))
      flash[:notice] = "施設名「#{@room.name}」の情報を更新しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    def destroy
      @room = Room.find(params[:id])
      @room.destroy
      flash[:notice] = "施設を削除しました"
      redirect_to :rooms
    end
  end
end
