class PointsController < ApplicationController
  before_action only: %i[ show ]

  # GET /points
  def index
    @points = Point.all

    @featureCollection = {
      "type": "FeatureCollection",
      "features": @points
    }

    render json: @featureCollection
  end

  # POST /points/single
  def show
    @point = Point.where(
      :"geometry" => {
        :"$geoIntersects" => {
          :"$geometry" => {
            :type => "Point",
            :coordinates => [params[:long], params[:lat]]
          }
        }
      }
    )

    render json: @point
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_point
    #   @point = Point.find(params[:lat], params[:long])
    # end

    # Only allow a list of trusted parameters through.
    # def point_params
    #   params.require(:point).permit(:lat, :long)
    # end
end
