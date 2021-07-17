class Public::ChatsController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find(params[:id]) #相手の会員IDを取得
    rooms = current_customer.customer_rooms.pluck(:room_id) #自分の会員ルームのルームIDを
    customer_rooms = CustomerRoom.find_by(customer_id: @customer.id, room_id: rooms)

    unless customer_rooms.nil? #ルームがあれば@roomに代入
      @room = customer_rooms.room
    else #ルームがなければ新しく作る
      @room = Room.new
      @room.save
      CustomerRoom.create(customer_id: current_customer.id, room_id: @room.id) #相手の会員ルームのレコードを追加
      CustomerRoom.create(customer_id: @customer.id, room_id: @room.id) #自分の会員ルームのレコードを追加
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @room = Room.find(params[:chat][:room_id])
    @chats = @room.chats
    @chat = current_customer.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end

end
