class ThingsController < ApplicationController

  def create
    @user = Thing.new(params[:user])

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
