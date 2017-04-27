include ActionView::Helpers::NumberHelper

class CalculationsController < ApplicationController

  def flex_square
    # params = {"the_number"=> "17"}
    @user_provided_number = params["the_number"].to_f
    @squared_number = @user_provided_number **  2
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    # params = {"the_number"=> "17"}
    @user_provided_number = params["the_number"].to_f
    @square_root_number = Math.sqrt(@user_provided_number)
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    # params = {"the_number"=> "17"}
    @user_basis_points = params["basis_points"].to_f
    @monthly_rate = @user_basis_points/120000

    @user_number_of_years = params["number_of_years"].to_f
    @months  = @user_number_of_years * 12

    @user_present_value = params["present_value"].to_f

    @numerator = @monthly_rate * @user_present_value
    @denominator = 1 - ((1 + @monthly_rate) ** -(@months))

    @result = number_to_currency(@numerator/@denominator)
    render("calculations/flex_payment.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    @user_provided_number = params["number_to_be_squared"].to_f
    @squared_number = @user_provided_number **  2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    @user_provided_number = params["number_to_be_square_rooted"].to_f
    @square_root_number = Math.sqrt(@user_provided_number)
    render("calculations/square_root.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment
    @user_basis_points = params["basis_points"].to_f
    @monthly_rate = @user_basis_points/1200

    @user_number_of_years = params["number_of_years"].to_f
    @months  = @user_number_of_years * 12

    @user_present_value = params["present_value"].to_f

    @numerator = @monthly_rate * @user_present_value
    @denominator = 1 - ((1 + @monthly_rate) ** -(@months))

    @result = number_to_currency(@numerator/@denominator)
    render("calculations/payment.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random
    @min = params["min"].to_f
    @max = params["max"].to_f
    @random_number = rand(@min...@max).round(4)
    render("calculations/random.html.erb")
  end


end
