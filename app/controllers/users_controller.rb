class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # debugger # запускает консольный режим отладки. Приложение не запустится, пока не пройдет всю отладку, или сочетанием клавиш CTRL+D
    # puts @user.attributes.to_yaml
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
