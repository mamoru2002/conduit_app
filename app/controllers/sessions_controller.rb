class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      log_in user

      redirect_to root_path, notice: "ログインしました。"
    else

      flash.now[:alert] = "メールアドレスまたはパスワードが不正です。"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    log_out
    redirect_to root_path, notice: "ログアウトしました。", status: :see_other
  end
end
