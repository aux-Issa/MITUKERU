class Review < ApplicationRecord
  enum type_of_property: { apartment: 0, house: 1, land: 2 }
  enum gender: { male: 0, female: 1, other: 2 }
  enum reason_for_sales: { 
                            relocation: 1, 
                            inheritance: 2, 
                            job_change: 3, 
                            divorce: 4, 
                            asset_liquidation: 5, 
                            financial_reason: 6, 
                            other_reason: 99
                          }
  enum contract_category: { 
                            privileged_and_exclusive_brokerage_service_agreement: 1, 
                            exclusive_brokerage_service_agreement: 2 , 
                            non_exclusive_brokerage_service_agreement: 3, 
                            unknown: 4
                          }
  enum times_of_sales: { first_time: 0, second_time: 1 , more_than_two_times: 2}

  belongs_to :shop
  belongs_to :city
end
