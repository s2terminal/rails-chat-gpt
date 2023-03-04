class FormController < ApplicationController
  def index
    @message = session[:message]
  end

  def create
    # フォームの送信
    @message = params[:message]
    session[:message] = params[:message]
    redirect_to form_path
  end
end
