class StaticPagesController < ApplicationController
  def home

  end

  def help
    @users = User.all
  end

  def passwords
    @keys = Keychain.all
    @users = User.all
    end


end
