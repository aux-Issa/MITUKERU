# frozen_string_literal: true
require 'rails_helper'

RSpec.describe AssessmentRequest, type: :model do
  subject do
    instance.valid?
    instance.errors.full_messages
  end

  let(:instance) { described_class.new(assessment_request_attrs) }

  let(:assessment_request_attrs) do
    {
      branch_id:,
      property_city:,
      property_address:,
      property_type:,
      property_exclusive_area:,
      property_land_area:,
      property_building_area:,
      property_building_area_unit:,
      property_floor_area:,
      url_param: 'mituke-ru',
      property_room_plan:,
      property_constructed_year:,
      user_email:,
      user_name: nil,
      user_family_name:,
      user_given_name:,
      user_name_kana: nil,
      user_family_name_kana:,
      user_given_name_kana:,
      user_tel:
    }
  end
  let(:branch_id) { 1 }
  let(:property_city) { 660 }
  let(:property_address) { '六本木3-2-1 六本木グランドタワー39階' }
  let(:property_type) { 1 }
  let(:property_exclusive_area) { 1.5 }
  let(:property_land_area) { 1.5 }
  let(:property_building_area) { 1.5 }
  let(:property_building_area_unit) { 1 }
  let(:property_floor_area) { 1.5 }
  let(:property_room_plan) { 1 }
  let(:property_constructed_year) { 1990 }
  let(:user_email) { 'sample@sample.com' }
  let(:user_family_name) { '山田' }
  let(:user_given_name) { '太郎' }
  let(:user_family_name_kana) { 'やまだ' }
  let(:user_given_name_kana) { 'たろう' }
  let(:user_tel) { '0901234567' }

  context '正常な値を入力したとき' do
    it { is_expected.to eq [] }
  end

  context '異常な値を入力したとき' do
    context 'property_city' do
      context 'nilの場合' do
        let(:property_city) { nil }

        it { is_expected.to include "市区町村を入力してください" }
      end
    end
  end
end
