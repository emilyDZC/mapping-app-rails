class CrossbillsController < ApplicationController
    before_action only: %i[ show ]
  
    # GET /crossbills
    def index
      @crossbills = Crossbill.all
  
      @featureCollection = {
        "type": "FeatureCollection",
        "features": @crossbills
      }
  
      render json: @featureCollection
    end
  

    private

  end