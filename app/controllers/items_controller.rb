class ItemsController < ApplicationController
  def index
  end
end

private

def message_params
  params.requiere(:item).permit(:content, :image).merge(user_id: current_user.id)
end