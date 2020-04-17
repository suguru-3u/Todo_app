class ListsController < ApplicationController

  # users/showの投稿機能
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      @lists = current_user.lists
     respond_to do |format|
       format.json
       format.html{redirect_to user_path(current_user.id)}
     end
   else
     @user = User.find(current_user.id)
     @lists = @user.lists
     render 'users/show'
   end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:success] = "Todolist updated"
      redirect_to user_path(current_user.id)
    else
      render 'edit'
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to user_path(current_user.id)
  end

  private

    def list_params
      params.require(:list).permit(:title,:body,:user_id)
    end

end
