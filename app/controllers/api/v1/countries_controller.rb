class Api::V1::CountriesController < ApplicationController
  before_action :set_country, only: [:update, :destroy, :show]

  # def index
  #   @countries = Country.all
  #   render json: @countries
  # end

  def show
    render json: @country
  end

  # def show_two
  #   @country_1 = Country.find(params[:id_1])
  #   @country_2 = Country.find(params[:id_2])
  #   render json: @country_1, @country_2
  # end

  def create
    @country = Country.new(country_params)
    if @country.save
      render json: @country, status: :created
    else
      render json: @country.errors, status: :unprocessable_entity
    end
  end

  # def update
  #   if @country.update(country_params)
  #     render json: @country
  #   else
  #     render json: @country.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # def destroy
  #   @post.destroy
  # end

  private


      def country_params
        params.require(:country).permit(:name, :ag_pct, :adult_hiv , :age_marriage, :empl_rate, :unempl_rate, :aid_given, :aid_received, :alcohol_consumption, :hiv_deaths, :army, :births_staffed, :bmi_m, :bmi_w, :breast_c, :cell_phones, :cervical_c, :child_mort, :children_pw, :co2_pp,, :coal_pp, :colon_c_m, :colon_c_w, :debt_for, :dem_s, :elec_gen_pp, :elec_use_pp, :exp_prim, :exp_sec, :exp_tert, :exports, :ext_pov, :workers_f, :empl_rate_f, :food_supply, :forest_a, :forest_cov, :gdp_pp, :gdp_growth, :gdp_growth_tenyr, :gni_pp, :govt_health_exp, :govt_health_exp_pp, :hdi, :imp_san_acc, :imports, :inc_top_ten, :inc_bot_ten, :industry, :inequality, :inf_mort, :inflation, :int_users, :life_exp, :lit_f, :lit_m, :liver_c_m, :liver_c_f, :lung_c_m, :lung_c_f, :malaria, :empl_rate_m, :malnut, :mat_mort, :edu_yr_m, :edu_yr_f, :med_age, :doctors, :mil_exp, :murder, :nat_gas_prod, :oil_con_pp, :oil_prod, :oil_proved, :comp_pp, :pop_den, :pop_growth, :pop_urb, :pov, :prostate_c, :pump_gas, :sex_rat, :smoking, :stomach_c_m, :stomach_c_f, :sugar_pp, :suicide, :suicide_m, :suicide_f, :area, :tax, :trad_bal, :traffic_d, :wrk_hr, :pop)
      end

      def set_country
        @country ||= Country.find(params[:id])
      end

  end
