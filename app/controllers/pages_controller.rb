class PagesController < ApplicationController
  def start
    if user_signed_in?
      redirect_to home_path
    else
      render layout: "start"
    end

  end

  def home
    if !user_signed_in?
      redirect_to root_path
    else
      render layout: "home"
    end
  end
end
