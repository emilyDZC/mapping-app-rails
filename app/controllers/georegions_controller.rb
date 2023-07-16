class GeoregionsController < ApplicationController
    before_action only: %i[ show ]
  
    # GET /georegions
    def index
      @regions = Georegion.all
  
      @featureCollection = {
        "type": "FeatureCollection",
        "features": @regions
      }
  
      render json: @featureCollection
    end
  
    # GET /georegions/single
    def show
      @georegion = Georegion.where(
        :"geometry" => {
          :"$geoIntersects" => {
            :"$geometry" => {
              :type => "Point",
              :coordinates => [params[:lat], params[:long]]
            }
          }
        }
      )
  
      render json: @georegion
    end

    private

  end