module Api::V1
  class StructureController < ApplicationController
    include StructureHelper

    def index
      structure_response = company_structure
      render json: structure_response
    end

    def show
      @user = User.find(params[:id])
      subsection_response = subsection_structure(@user)
      render json: subsection_response
    end
  end
end