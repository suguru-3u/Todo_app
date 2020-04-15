class ListsController < ApplicationController
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
     redirect_to user_path(current_user.id)
   else
     @user = User.find(current_user.id)
     @lists = @user.lists
     render 'users/show'
   end
  end

  private

    def list_params
      params.require(:list).permit(:title,:body,:user_id)
    end

end
