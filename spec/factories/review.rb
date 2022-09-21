FactoryBot.define do
  factory :review do
    shop {build(:shop)}
    city {build(:city)}

    remaining_address {"品川2丁目"}
    type_of_property {"apartment"}
    times_of_sales {"first_time"}
    sale_consideration_date {"2018-02-14"}
    assessment_request_date {"2018-03-14"}
    sale_date {"2018-03-14"}
    sold_out_date {"2019-01-14"}
    delivery_date {"2019-07-31"}
    gender {"female"}
    age {46}
    assessment_price {22000000}
    sale_price {22500000}
    required_months_after_discount {3}
    discount_price {500000}
    contract_price {17000000}
    contract_category {"exclusive_brokerage_service_agreement"}
    title {"港区：担当者の対応が良かったです。"}
    reason_for_sales {"asset_liquidation"}
    concern_at_sales {"港区品川：山路（やまみち）を登りながら、こう考えた。知に働けば角が立つ。情に棹させば流される。意地を通せば窮屈だ。とかくに人の世は住みにくい。\r\n住みにくさが高じると、安いところへ引き越したくなる。どこへ越しても住みにくいと悟った時、詩が生まれて、画ができる。"}
    reason_for_selection {"港区品川：吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事\r\nだけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれ"}
    response_satisfaction {5}
    reason_for_response_satisfaction {"港区品川：恥の多い生涯を送って来ました。自分には、人間の生活というものが、見当つかないのです。\r\n自分は東北の田舎に生れましたので、汽車をはじめて見たのは、よほど大きくなってからでした。自分は停車場のブリッジを、上"}
    advice {"港区品川：木曾路はすべて山の中である。\r\nあるところは岨づたいに"}
    improvement_point {"ちゃんとしてください！！！"}
  end
end