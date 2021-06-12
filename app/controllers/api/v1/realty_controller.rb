module Api
    module V1
      class RealtyController < ApplicationController
        include Rails.application.routes.url_helpers

        #before_action :authenticate_request!
        before_action :set_realty, only:  [:show,:images]

        def index
          @realty = Realty.select("
            realties.id,
            CONCAT(coalesce(apple, 0),coalesce(property, 0)) as avaluo,
            name_realty,
            CONCAT(unit_estate,' ', street,' ', number_unit,' ', communes.name) as address,
            coalesce(mt2_land, 0) as mt2_land,
            coalesce(mt2_built, 0) as mt2_built,
            coalesce(bathroom, 0) as bathroom,
            coalesce(parking_lot, 0) as parking_lot,
            coalesce(cellar, 0) as cellar,
            coalesce(bedroom, 0) as bedroom,
            coalesce(ambient, 0) as ambient,
            latitude,
            longitude,
            case WHEN coalesce(rent, 0) = 1  THEN 'publicado' else 'no publicado' end as rent,
            case WHEN coalesce(sell, 0) = 1  THEN 'publicado' else 'no publicado' end as sell,
            case WHEN coalesce(rent_season, 0) = 1  THEN 'publicado' else 'no publicado' end as rent_season,
            case WHEN coalesce(rent_state, 0) = 1  THEN 'valido arrendar' else 'no valido arrendar' end as rent_state,
            case WHEN coalesce(sell_state, 0) = 1  THEN 'valido vender' else 'no valido vender' end as sell_state,
            case WHEN tipo = 0  THEN 'casa'
            WHEN tipo = 1  THEN 'departamento'
            WHEN tipo = 2  THEN 'local'
            WHEN tipo = 3  THEN 'oficina'
            WHEN tipo = 4  THEN 'bodega'
            WHEN tipo = 5  THEN 'sitio'
            WHEN tipo = 6  THEN 'estacionamiento'
            WHEN tipo = 7  THEN 'parcela'
            end as tipo,
            communes.name as commune, regions.name as region")
          .joins("INNER JOIN type_realties ON type_realties.realty_id = realties.ID")
          .joins("INNER JOIN communes ON communes.id = realties.commune_id")
          .joins("INNER JOIN regions ON regions.id = communes.region_id")
          .joins("LEFT JOIN publications ON publications.realty_id = realties.id").order("realties.id")
          render json: @realty.paginate(page: params[:page], per_page: 100)
        end

        def images
          @url = 'https://remateapp.herokuapp.com/uploads/'
          @fileUpload = rails_blob_url(Realty.find(params[:id]).uploads[0]) #Realty.where(id: @realty.id)
          render json: @fileUpload ? @fileUpload : []
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