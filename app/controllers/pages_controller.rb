class PagesController < ApplicationController
  def square
    render({ :template => "/square" })
  end

  def square_results
    @number = params[:number].to_f
    @result = @number ** 2
    render({ :template => "/square_results" })
  end

  def root
    render({ :template => "/square_root" })
  end

  def root_results
    @number = params[:number].to_f
    @result = Math.sqrt(@number)
    render({ :template => "/square_root_results" })
  end

  def random
    render({ :template => "/random" })
  end

  def random_results
    @min = params[:user_min].to_f
    @max = params[:user_max].to_f
    @result = rand(@min..@max)
    render({ :template => "/random_results" })
  end

  def payment
    render({ :template => "/payment" })
  end

  def payment_results
    @apr = params[:apr].to_f
    @years = params[:years].to_i
    @principal = params[:principal].to_f
    @monthly_payment = calculate_payment(@apr, @years, @principal)
    render({ :template => "/payment_results" })
  end

  def calculate_payment(apr, years, principal)
    monthly_rate = (apr / 100) / 12
    months = years * 12
    (principal * monthly_rate) / (1 - (1 + monthly_rate) ** -months)
  end
end
