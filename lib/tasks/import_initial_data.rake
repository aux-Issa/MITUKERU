require 'csv'
# 初期データをインポートする用のrake タスク

# bundle exec rake import_initial_data:prefectures
# bundle exec rake import_initial_data:cities
# bundle exec rake import_initial_data:companies_shops
# bundle exec rake import_initial_data:assessable_areas
# bundle exec rake import_initial_data:reviews
namespace :import_initial_data do
  desc "Import prefectures from csv"
  task prefectures: :environment do
    path = File.join Rails.root, "assets/csv/prefectures.csv"
    relative_path = "." + path
    list = []

    CSV.foreach(relative_path, headers: true) do |row|
      list << {
          name: row["name"]
      }
    end
    puts "start to create prefecture data"
    begin
      # hash配列でまとめて作成
      Prefecture.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import cities from csv"
  task cities: :environment do
    path = File.join Rails.root, "assets/csv/cities.csv"
    list = []

    relative_path = "." + path
    CSV.foreach(relative_path, headers: true) do |row|
      list << {
          id: row["id"], # primary_key
          prefecture_id: row["prefecture_id"], # foreign_key
          name: row["name"]
      }
    end
    puts "start to create city data"
    begin
      City.create!(list)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import companies from shops-csv"
  task companies_shops: :environment do
    path = File.join Rails.root, "assets/csv/shops.csv"
    company_list = []
    relative_path = "." + path
    CSV.foreach(relative_path, headers: true) do |row|
      company_list << {
          name: row["企業名"],
          ieul_company_id: row["ieul_企業id"]
      }
    end
    # 会社は重複の可能性があるのでuniqueにする
    company_list.uniq!

    shop_list = []
    CSV.foreach(relative_path, headers: true) do |row|
      city_id = City.find_by(name: row["市区町村"]).id
      company_name = row["企業名"]
      shop_list << {
        # 紐づけるために会社名をkeyに
        "#{company_name}" => {
          city_id: city_id, # foreign_key,
          ieul_shop_id: row["ieul_店舗id"],
          postal_code: row["郵便番号"],
          name: row["店舗名"],
          catch_copy: row["キャッチコピー"],
          remaining_address: row["以降住所"],
          telephone_number: row["電話番号"],
          fax_number: row["FAX番号"],
          opening_hour: row["営業時間"],
          holiday: row["定休日"],
          introduction: row["紹介文"],
          logo_url: row["ロゴURL"],
    }}
    end

    puts "start to create company data"
    begin
      company_list.each do |company_hash|
        company = Company.new(company_hash)
        shop_list.each do |shop_hash|
          if company.name == shop_hash.keys[0] # 会社名が一致したら紐づける
            company.shops.build(shop_hash.values[0])
            company.save!
          end
        end
      end
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error : unKnown attribute "
    end
  end

  desc "Import assesable areas from shops-csv"
  task assessable_areas: :environment do
    path = File.join Rails.root, "assets/csv/shops.csv"
    relative_path = "." + path
    relative_path = "." + path
    CSV.foreach(relative_path, headers: true) do |row|
      area_ids = row["査定依頼可能エリア"].split(",").map(&:to_i)

      list = []
      area_ids.each do |area_id|
        list << {city_id: area_id}
      end

      shop = Shop.find_by(ieul_shop_id: row["ieul_店舗id"])
      shop.assessable_areas.build(list)

      begin
        shop.save!
        puts "#{shop.name}: completed!!"
      rescue ActiveModel::UnknownAttributeError => invalid
        puts "#{shop.name} => raised error : unKnown attribute"
      end
    end
    puts "done"
  end

  desc "Import reviews from csv"
  task reviews: :environment do
    path = File.join Rails.root, "assets/csv/reviews.csv"
    relative_path = "." + path
    CSV.foreach(relative_path, headers: true) do |row|
      shop_id = Shop.find_by(ieul_shop_id: row["ieul_店舗id"]).id
      city_id = City.find_by(name: row["市区町村"]).id
      type_of_property = Review.type_of_properties_i18n.invert[row["物件種別"]].to_sym
      gender = Review.genders_i18n.invert[row["性別"]].to_sym
      times_of_sales = Review.times_of_sales_i18n.invert[row["売却回数"]].to_sym

      review_property = {
          shop_id: shop_id, #foreign_key
          city_id: city_id, #foreign_key
          remaining_address: row["住所全部"],
          type_of_property: type_of_property,
          times_of_sales: times_of_sales,
          sale_consideration_date: row["売却検討時期"],
          assessment_request_date: row["査定依頼時期"],
          sale_date: row["売出時期"],
          sold_out_date: row["売却時期"],
          delivery_date: row["引渡時期"],
          gender: gender,
          age: row["年齢"],
          assessment_price: row["査定価格"],
          sale_price: row["販売価格"],
          required_months_after_discount: row["売り出してから何ヶ月後に値下げしたか"],
          discount_price: row["値下げ価格"],
          contract_price: row["成約価格"],
          contract_category: row["媒介契約の形態"].to_i,
          title: row["見出し"],
          reason_for_sales: row["売却理由"].to_i,
          concern_at_sales: row["売却時に不安だったこと"],
          reason_for_selection: row["この会社に決めた理由"],
          response_satisfaction: row["不動産会社の対応満足度"],
          reason_for_response_satisfaction: row["不動産会社の対応満足度の理由"],
          advice: row["今後売却する人へのアドバイス"],
          improvement_point: row["不動産会社に改善してほしい点"],
      }
      puts "start to create review data"
      begin
        # hash配列でまとめて作成
        Review.create!(review_property)
        puts "completed!!"
      rescue ActiveModel::UnknownAttributeError => invalid
        puts "raised error : unKnown attribute "
      end
    end
  end
end
