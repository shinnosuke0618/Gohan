# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
  # 退会しているかを判断するメソッド
    def customer_state
      @customer = Customer.find_by(email: params[:customer][:email])  ## 【処理1】 emailからアカウントを1件取得
    return if !@customer # アカウントを取得できなかった場合、このメソッドを終了
    if @customer.valid_password?(params[:customer][:password]) ## 【処理2】 取得したアカウントのパスワードと入力されたパスワードが一致してるか判別
      if @customer.is_deleted == true## 【処理3】
        flash[:alert] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to new_customer_registration_path
      else
        sign_in @customer
      end
    end
    end

  def after_sign_in_path_for(resource)
    root_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
