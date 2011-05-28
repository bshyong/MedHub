class ThingDataController < ApplicationController

  def create

    @thing_data = ThingData.new

    respond_to do |format|
      if @thing_data.save
        format.html { redirect_to(:controller => 'home', :action => 'login'); flash[:notice] = 'THINGDATA CREATED' }
        #format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @thing_data, :status => :created, :location => @thing_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thing_data.errors, :status => :unprocessable_entity }
      end
    end
  end

end
