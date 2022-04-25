class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:guest_sign_in]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
     if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to customers_path
     else
       flash.now[:alert] = "会員情報を入力してください。"
       render :edit
     end
  end

  def unsubscribe #退会確認画面
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def guest_sign_in  #ゲストログイン
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーでログインしました。'
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :email)
  end

end
