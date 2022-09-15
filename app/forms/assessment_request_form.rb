class RequestForm
    include ActiveModel::Model # 通常のモデルのようにvalidationなどを使えるようにする
    include ActiveModel::Attributes # ActiveRecordのカラムのような属性を加えられるようにする
  
    attribute :branch_id
end
  