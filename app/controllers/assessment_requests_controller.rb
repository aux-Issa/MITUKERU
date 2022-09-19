# frozen_string_literal: true

require 'net/http'
require 'uri'

class AssessmentRequestsController < ApplicationController
  def thx; end

  def new
    @assessment_request = AssessmentRequest.new
    # TODO: 存在しないshop_idを指定した時の挙動（index ページにリダイレクトなど）
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @assessment_request = AssessmentRequest.new(assessment_request_params)
    @shop = Shop.find(@assessment_request.branch_id)
    if @assessment_request.valid?

      response = post_assessment_request(@assessment_request)
      logger.debug(response)

      redirect_to assessment_requests_success_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def assessment_request_params
    params.require(:assessment_request).permit(
      :branch_id,
      :property_city,
      :property_address,
      :property_type,
      :property_exclusive_area,
      :property_land_area,
      :property_building_area,
      :property_building_area_unit,
      :property_floor_area,
      :url_param,
      :property_room_plan,
      :property_constructed_year,
      :user_email,
      :user_name,
      :user_name_kana,
      :user_tel
    )
  end

  def post_assessment_request(assessment_request)
    uri = 'https://miniul-api.herokuapp.com/affiliate/v2/conversions'
    uri = URI.parse(uri)
    header = { 'Content-Type': 'application/json' }
    param = assessment_request.attributes

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    http.request_post(uri, param.to_json, header)
  end
end
