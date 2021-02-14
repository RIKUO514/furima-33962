class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).parmit(:content, :image).merge(user_id: current_user.id)
  end
end
