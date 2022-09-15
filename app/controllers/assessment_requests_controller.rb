class AssessmentRequestsController< ApplicationController

    def new
      @assessment_request= AssessmentRequest.new
    end
  
    def create
      @assessment_request= AssessmentRequest.new(assessment_request_params)
      if @assessment_request.valid?
        redirect_to render html: "save"
      else
        redirect_to render html: "save failed"
      end
    end
  
    private
    def assessment_request_params
      params.require(:assessment_request).permit(
          # :branch_id, 
          :property_city, 
          :property_address, 
          :property_type, 
          :property_exclusive_area, 
          :property_land_area, 
          :property_building_area, 
          :property_building_area_unit, 
          :property_floor_area, 
          # :url_param, 
          :property_room_plan, 
          :property_constructed_year, 
          :user_email, 
          :user_name, 
          :user_name_kana, 
          :user_tel)
    end
  end