#require 'digest/sha2'

class HomeController < ApplicationController

#  attr_accessor :new_password, :new_password_confirmation
#  before_save :hash_new_password, :if=>:password_changed?
#
#  def create_user
#    # creates user Thing; users are type 1 Things
#    @user_thing = Thing.new(:thing_type => 1)
#    @user_handle = ThingData.new(:attribute => 'handle', :thing_id => @user_thing.id)
#    @user_salt = ThingData.new(:attribute => 'salt', :value => ActiveSupport::SecureRandom.base64(8))
#    @hashed_password = ThingData.new(:attribute => 'hashed_password', :value => Digest::SHA2.hexdigest(user_salt + @new_password))
#    @user_email = ThingData.new()
#
#    if @user.thing.save && @user_handle.save && @user_salt.save && @hashed_password.save
#      flash[:notice] = "User account created."
#    end
#
#  end

  def signup
    @user = Thing.new
  end

  def logout
    
  end

  def index
    
  end

end