class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @question = @user.questions
  end
end
