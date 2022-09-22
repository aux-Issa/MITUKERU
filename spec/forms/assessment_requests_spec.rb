# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssessmentRequest, type: :model do
  def get_attr_name_jp(attr)
    I18n.t(attr, scope: %i[activemodel attributes assessment_request])
  end

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

  context '各attributeの値を変えたとき' do
    context 'property_city' do
      context 'nilの場合' do
        let(:property_city) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_city)}を入力してください" }
      end
    end

    context 'property_address' do
      context 'nilの場合' do
        let(:property_address) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_address)}を入力してください" }
      end

      context '50文字の場合' do
        let(:property_address) { '東' * 50 }

        it { is_expected.to be_empty }
      end

      context '51文字の場合' do
        let(:property_address) { '東' * 51 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_address)}は50文字以内で入力してください" }
      end
    end

    context 'property_type' do
      context 'nilの場合' do
        let(:property_type) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_type)}を入力してください" }
      end
    end

    context 'property_exclusive_area' do
      context 'nilの場合' do
        let(:property_exclusive_area) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_exclusive_area)}を入力してください" }
      end

      context '文字列の場合' do
        let(:property_exclusive_area) { 'thirteen' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_exclusive_area)}は数値で入力してください" }
      end
    end

    context 'property_land_area' do
      context 'nilの場合' do
        let(:property_land_area) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_land_area)}を入力してください" }
      end

      context '文字列の場合' do
        let(:property_land_area) { 'thirteen' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_land_area)}は数値で入力してください" }
      end
    end

    context 'property_building_area' do
      context 'nilの場合' do
        let(:property_building_area) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_building_area)}を入力してください" }
      end

      context '文字列の場合' do
        let(:property_building_area) { 'thirteen' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_building_area)}は数値で入力してください" }
      end
    end

    context 'property_building_area_unit' do
      context 'nilの場合' do
        let(:property_building_area_unit) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_building_area_unit)}を入力してください" }
      end
    end

    context 'property_floor_area' do
      context 'nilの場合' do
        let(:property_floor_area) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_floor_area)}を入力してください" }
      end

      context '文字列の場合' do
        let(:property_floor_area) { 'thirteen' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_floor_area)}は数値で入力してください" }
      end
    end

    context 'property_room_plan' do
      context 'nilの場合' do
        let(:property_room_plan) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_room_plan)}を入力してください" }
      end
    end

    context 'property_constructed_year' do
      context 'nilの場合' do
        let(:property_constructed_year) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_constructed_year)}を入力してください" }
      end

      context '文字列の場合' do
        let(:property_constructed_year) { 'thirteen' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_constructed_year)}は数値で入力してください" }
      end

      context '小数の場合' do
        let(:property_constructed_year) { 1.5 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:property_constructed_year)}は整数で入力してください" }
      end
    end

    context 'user_email' do
      context 'nilの場合' do
        let(:user_email) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_email)}を入力してください" }
      end

      context '@がない場合' do
        let(:user_email) { 'sampleasample.com' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_email)}は不正な値です" }
      end

      context 'ピリオドがない場合' do
        let(:user_email) { 'sample@samplecom' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_email)}は不正な値です" }
      end
    end

    context 'user_family_name' do
      context 'nilの場合' do
        let(:user_family_name) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_family_name)}を入力してください" }
      end

      context '32文字の場合' do
        let(:user_family_name) { '山' * 32 }

        it { is_expected.to be_empty }
      end

      context '33文字の場合' do
        let(:user_family_name) { '山' * 33 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_family_name)}は32文字以内で入力してください" }
      end
    end

    context 'user_given_name' do
      context 'nilの場合' do
        let(:user_given_name) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_given_name)}を入力してください" }
      end

      context '32文字の場合' do
        let(:user_given_name) { '山' * 32 }

        it { is_expected.to be_empty }
      end

      context '33文字の場合' do
        let(:user_given_name) { '山' * 33 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_given_name)}は32文字以内で入力してください" }
      end
    end

    context 'user_family_name_kana' do
      context 'nilの場合' do
        let(:user_family_name_kana) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_family_name_kana)}を入力してください" }
      end

      context '64文字の場合' do
        let(:user_family_name_kana) { 'や' * 64 }

        it { is_expected.to be_empty }
      end

      context '65文字の場合' do
        let(:user_family_name_kana) { 'や' * 65 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_family_name_kana)}は64文字以内で入力してください" }
      end

      context '漢字がある場合' do
        let(:user_family_name_kana) { '山田' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_family_name_kana)}は不正な値です" }
      end
    end

    context 'user_given_name_kana' do
      context 'nilの場合' do
        let(:user_given_name_kana) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_given_name_kana)}を入力してください" }
      end

      context '64文字の場合' do
        let(:user_given_name_kana) { 'た' * 64 }

        it { is_expected.to be_empty }
      end

      context '65文字の場合' do
        let(:user_given_name_kana) { 'た' * 65 }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_given_name_kana)}は64文字以内で入力してください" }
      end

      context '漢字がある場合' do
        let(:user_given_name_kana) { '太郎' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_given_name_kana)}は不正な値です" }
      end
    end

    context 'user_tel' do
      context 'nilの場合' do
        let(:user_tel) { nil }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_tel)}を入力してください" }
      end

      context 'ハイフンがある場合' do
        let(:user_tel) { '090-0000-000' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_tel)}は不正な値です" }
      end

      context '0から始まらない場合' do
        let(:user_tel) { '9001111222' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_tel)}は不正な値です" }
      end

      context '12桁の場合' do
        let(:user_tel) { '090111122223' }

        it { is_expected.to contain_exactly "#{get_attr_name_jp(:user_tel)}は不正な値です" }
      end
    end
  end
end
