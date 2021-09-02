FactoryBot.define do
  factory :purchase_shipping do
    post_code              {"123-4567"}
    prefecture_id          {2}
    city                   {"gold"}
    address                {"caffe"}
    telephone              {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
