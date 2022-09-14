class AssessmentRequestsController< ApplicationController

    def new
      @assessment_request_form= AssessmentRequestForm.new
      debugger
    end
  
    def create
      @assessment_request_form= AssessmentRequestForm.create(assessment_request_params)
      debugger
      if @assessment_request_form.save
        render html: "save"
      else
        render html: "save failed"
      end
    end
  
    private
    def assessment_request_params
      params.require(:assessment_request_form).permit(
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