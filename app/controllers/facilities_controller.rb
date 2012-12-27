class FacilitiesController < ApplicationController
  def home
    rebekka = Member.find(2550);
    render :inline => rebekka.hp_last_name
  end
  
  def cities
    
  end
  
  def map
    
  end
  
  def locate
    #We check if a city param is passed, otherwise we 
    #just return NYC results.
    if(params[:city])
      city = params[:city]
    else
      city = 'New York'
    end
    
    @provider_addresses = ProviderAddress.includes(:provider).limit(100).where({:hp_city_name => city.upcase})
    
    logger.debug "TEST INFOOOO #{@provider_addresses.count}"
    
    render :json => @provider_addresses.to_json(:include => :provider)
  end

  def plot_latlong
    @provider_addresses = ProviderAddress.where({:qs_latitude => nil, :qs_longitude => nil})
  end

  def update_latlong
    @provider = ProviderAddress.find(params[:id])
    logger.debug "Existing Provider #{@provider.qs_latitude.inspect}"
    
    @provider.qs_longitude = params[:lat]
    @provider.qs_latitude = params[:lng]
    logger.debug "New Provider #{@provider.attributes.inspect}"
    
    if @provider.save
     render :json => {status: 'ok'}
    end
  end

end
