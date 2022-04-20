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
    @customer.update(customer_params)
    redirect_to customers_path
  end

  def unsubscribe #退会確認画面
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'guestuserでログインしました。'
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :email)
  end

end
