module Api
    module V1
      class RealtyController < ApplicationController
        def index
          @realty = Realty.all
          render json: @realty
        end
      end
    end
end