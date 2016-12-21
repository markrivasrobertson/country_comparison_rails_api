class Api::V1::CountriesController < ApplicationController
  before_action :set_country, only: [:update, :destroy, :show]

  def index
    @countries = Country.all
    render json: @countries
  end

  def show
    @country = Country.find(params[:id])
    render json: @country
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      render json: @country, status: :created
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  def update
    if @country.update(country_params)
      render json: @country
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @country.destroy
  end

  private


      def country_params
        params.permit(:id)
      end

      def set_country
        @country ||= Country.find(params[:id])
      end

  end
