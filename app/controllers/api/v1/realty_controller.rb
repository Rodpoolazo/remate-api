module Api
    module V1
      class RealtyController < ApplicationController
        before_action :authenticate_request!
        before_action :set_realty, only:  [:show,:images]

        def index
          @realty = Realty.select('*,realties.id as id,communes.name as commune,provinces.name as provinces,regions.name as regions')
          .joins("INNER JOIN communes ON communes.id = realties.commune_id")
          .joins("INNER JOIN provinces ON provinces.id = communes.province_id")
          .joins("INNER JOIN regions ON regions.id = communes.region_id")
          .joins("LEFT JOIN publications ON publications.realty_id = realties.id")

          render json: @realty.paginate(page: params[:page], per_page: 100)
        end

        def images
          @fileUpload = FileUpload.find_by(id: @realty.id).all
          render json: @fileUpload
        end

        def show
          render json: @realty
        end

        private

        def set_realty
          @realty = Realty.find(params[:id])
        end
      
      end
    end
end