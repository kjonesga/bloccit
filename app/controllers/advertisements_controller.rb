class AdvertisementsController < ApplicationController

  layout false

  def index
  	@advertisements = Advertisement.all
  end

  def show
  	@advertisement = Advertisement.find(params['id'])
    
  end
end
