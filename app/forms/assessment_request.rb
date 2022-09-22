# frozen_string_literal: true

class AssessmentRequest
  include ActiveModel::Model # 通常のモデルのようにvalidationなどを使えるようにする
  include ActiveModel::Attributes # ActiveRecordのカラムのような属性を加えられるようにする

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_TELEPHONE_NUMBER = /\A0\d{9,10}\Z/
  # VALID_NAME_REGEX = /\A[ぁ-んァ-ヴ一-龠a-zA-Z]+/u
  VALID_NAME_KANA_REGEX = /\A[ぁ-んa-zA-Z]+/

  attribute :branch_id, :integer
  attribute :property_city, :integer
  attribute :property_address, :string # 市区町村以降の住所
  attribute :property_type, :integer
  attribute :property_exclusive_area # float
  attribute :property_land_area # float
  attribute :property_building_area # float
  attribute :property_building_area_unit, :integer
  attribute :property_floor_area # float
  attribute :url_param, :string
  attribute :property_room_plan, :integer
  attribute :property_constructed_year # integer
  attribute :user_email
  attribute :user_family_name
  attribute :user_given_name
  attribute :user_name
  attribute :user_family_name_kana
  attribute :user_given_name_kana
  attribute :user_name_kana
  attribute :user_tel

  validates :property_city, presence: true
  validates :property_address, presence: true, length: { maximum: 50 }
  validates :property_type, presence: true
  validates :property_exclusive_area, presence: true, numericality: { allow_blank: true }
  validates :property_land_area, presence: true, numericality: { allow_blank: true }
  validates :property_building_area, presence: true, numericality: { allow_blank: true }
  validates :property_building_area_unit, presence: true
  validates :property_floor_area, presence: true, numericality: { allow_blank: true }
  validates :property_room_plan, presence: true
  validates :property_constructed_year, presence: true, numericality: { only_integer: true, allow_blank: true }
  validates :user_email, presence: true, length: { maximum: 100, allow_blank: true },
                         format: { with: VALID_EMAIL_REGEX, allow_blank: true }

  validates :user_family_name, presence: true, length: { maximum: 32, allow_blank: true }
  validates :user_given_name, presence: true, length: { maximum: 32, allow_blank: true }

  validates :user_family_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, allow_blank: true },
                                    length: { maximum: 64, allow_blank: true }
  validates :user_given_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX, allow_blank: true },
                                   length: { maximum: 64, allow_blank: true }

  validates :user_tel, presence: true, format: { with: VALID_TELEPHONE_NUMBER, allow_blank: true }

  def concat_name
    self.user_name = "#{user_family_name} #{user_given_name}"
  end

  def concat_name_kana
    self.user_name_kana = "#{user_family_name_kana} #{user_given_name_kana}"
  end

  def property_city_choices(shop)
    shop.assessable_areas.map do |assessable_area|
      city = City.find(assessable_area.city_id)
      [city.prefecture.name + city.name, assessable_area.city_id]
    end
  end

  def property_type_choices
    [['分譲マンション', 1], ['一戸建て', 2], ['土地', 3]]
  end

  def property_building_area_unit_choices
    [['平方メートル', 1],
     ['坪', 2]]
  end

  def property_room_plan_choices
    [['1R(ワンルーム)', 1],
     ['1K / 1DK', 2],
     ['1LK / 1LDK', 3],
     ['2K / 2DK', 4],
     ['2LK / 2LDK', 5],
     ['3K / 3DK', 6],
     ['3LK / 3LDK', 7],
     ['4K / 4DK', 8],
     ['4LK / 4LDK', 9],
     ['5K / 5DK', 10],
     ['5LK / 5LDK', 11],
     ['6K / 6DK', 12],
     ['6LK / 6LDK以上', 13]]
  end
end
