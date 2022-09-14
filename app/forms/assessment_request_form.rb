class AssessmentRequestForm
    include ActiveModel::Model # 通常のモデルのようにvalidationなどを使えるようにする
    include ActiveModel::Attributes # ActiveRecordのカラムのような属性を加えられるようにする
  
    attribute :branch_id, :integer # 
    attribute :property_city, :integer
    attribute :property_address, :string
    attribute :property_type, :integer # 1 ~ 3
    attribute :property_exclusive_area, :float
    attribute :property_land_area, :float
    attribute :property_building_area, :float
    attribute :property_building_area_unit, :integer # 1 ~ 2
    attribute :property_floor_area, :float
    attribute :url_param, :string #
    attribute :property_room_plan, :integer # 1 ~ 13
    attribute :property_constructed_year, :integer
    attribute :user_email
    attribute :user_name
    attribute :user_name_kana
    attribute :user_tel

    def save
      true
    end
  end
