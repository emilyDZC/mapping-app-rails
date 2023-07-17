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
  
    # POST /georegions/single
    def show
      @georegion = Georegion.where(
        :"geometry" => {
          :"$geoIntersects" => {
            :"$geometry" => {
              :type => "Point",
              :coordinates => [params[:long], params[:lat]]
            }
          }
        }
      )
  
      if @georegion.any?
        render json: @georegion[0].properties
      else
        render json: "Not found"
      end
    end

    private

  end