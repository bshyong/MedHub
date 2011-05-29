require 'digest/sha2'

class ThingsController < ApplicationController

    attr_accessor :new_password, :new_password_confirmation

  def new
    redirect_to root_path
  end

  def show
    redirect_to root_path
  end

  def create
    @user = Thing.new(params[:thing])
    @user.thing_type = 1
#    if @user.save
#    @user.first_name = params[:thing][:first_name]
#    @user.last_name = params[:thing][:last_name]
#    @user.email = params[:thing][:email]
#    end
  #  @user_handle = ThingData.create(:name => 'handle', :value => params[:first_name], :thing_id => @user.id)
 #   @user_salt = ThingData.create(:name => 'salt', :value => ActiveSupport::SecureRandom.base64(8), :thing_id => @user.id)
 #   @hashed_password = ThingData.create(:name => 'hashed_password', :value => Digest::SHA2.hexdigest(@user_salt.value + params[:new_password]), :thing_id => @user.id)
#    @user_email = ThingData.create(:name => 'email', :value => params[:email], :thing_id => @user.id)

#    if @user.save
#        @user_handle.thing_id =  @user.id
##        @user_salt.update_attribute(:thing_id => @user.id)
##        @hashed_password.update_attribute(:thing_id => @user.id)
##        @user_email.update_attribute(:thing_id => @user.id)
#    end

    respond_to do |format|
      if @user.save

        format.html { redirect_to(root_path); flash[:notice] = 'Account was created successfully' }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

end
