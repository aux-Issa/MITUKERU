class AssessmentRequest
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

    validates :property_city, presence: true # DBに存在するidかどうか
    validates :property_address, presence: true, length: {maximum: 50}
    validates :property_type, inclusion: {in: [1, 2, 3]}
    validates :property_exclusive_area, presence: true
    validates :property_land_area, presence: true
    validates :property_building_area, presence: true
    validates :property_building_area_unit, inclusion: {in: [1, 2]}
    validates :property_floor_area, presence: true
    validates :property_room_plan, inclusion: {in: (1..13).to_a}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :user_email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
    VALID_NAME_REGEX = /\A[ぁ-んァ-ヴ一-龠a-zA-Z]+ [ぁ-んァ-ヴ一-龠a-zA-Z]+/u
    validates :user_name, presence: true, format: { with: VALID_NAME_REGEX}
    validates :user_name_kana, presence: true, format: { with: VALID_NAME_REGEX}
    VALID_TELEPHONE_NUMBER = /0\d{9,10}/
    validates :user_tel, presence: true, format: { with: VALID_NAME_REGEX}

  end
