module Api
    module V1
      class RealtyController < ApplicationController
        before_action :set_realty, only:  [:show,:images]

        def index
          @realty = Realty.all
          render json: @realty
        end

        def images
          @fileUpload = FileUpload.find_by(id: @realty.id)
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