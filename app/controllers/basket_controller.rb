class BasketController < ApplicationController
  def update
    flash = basket_form.save ? success_flash : error_flash
    redirect_to shop_path, flash: flash
  end

  private

  def basket_form
    @basket_form ||= ::BasketForm.new(current_basket, basket_params)
  end

  def basket_params
    params.require(:basket).permit(:product_code)
  end

  def success_flash
    { notice: I18n.t('successfully_added_item_to_basket') }
  end

  def error_flash
    { error: I18n.t('there_was_a_problem_adding_the_item_to_your_basket') }
  end
end
