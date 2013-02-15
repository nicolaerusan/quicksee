class FacilitiesController < ApplicationController

  def compare
      
  end
  
  def cities
    
  end
  
  def map
    @body_id = 'facilities_index'
  end
  
  def locate
    #We check if a city param is passed, otherwise we 
    #just return NYC results.
    if(params[:city])
      city = params[:city]
    else
      city = 'New York'
    end
    
    if(current_user)
    
    
    
    
      logger.debug('here')
      # Get the user's class plan through member_eligibility
      
      @member_eligibility = MemberEligibility.where({:qs_memberID => current_user.id}).first
      
      #use the classplan to get the network_id
      @classplan = Classplan.where({:qs_classplanID => @member_eligibility.qs_classplanID}).first
            
      @providers = Provider.joins(:provider_address, :networks).includes(:provider_address, :networks).where(:hp_type_code => ['TM', 'UC', 'RC', 'ER']).where(:network => {:qs_networkID => @classplan.qs_networkID})
      
      logger.debug(@providers.count)
        
      #only reutn providers in their zipcode, that are in their networkID
      #:qs_networkID => users_network_id,
      
      #@network_providers = Provider.find(:all, :select)
      #@provider_addresses = ProviderAddress.includes(:provider).limit(100).where({:hp_postal_code => session[:zip_code], :qs_providerID in})
      
      #@provider_addresses.joins(:network_id)
      
    else
      @providers = Provider.joins(:provider_address).includes(:provider_address).limit(100).where({:hp_city_name => city.upcase})
    end
    
    
    logger.debug "TEST INFOOOO #{@providers.count}"
    
    render :json => @providers.to_json(:include => :provider_address)
  end

  def plot_latlong
    @provider_addresses = ProviderAddress.where('latlong_updated IS NULL')
  end

  def update_latlong
    @provider = ProviderAddress.find(params[:id])
    @provider.latlong_updated = true
    
    logger.debug "Existing Provider #{@provider.qs_latitude.inspect}"
    
    @provider.qs_longitude = params[:lat]
    @provider.qs_latitude = params[:lng]
    logger.debug "New Provider #{@provider.attributes.inspect}"
    
    if @provider.save
     render :json => {status: 'ok'}
    end
  end

  def show
    @body_id = 'facilities_show'
    @provider_address = ProviderAddress.includes(:provider).find(params[:id])
  end
end
