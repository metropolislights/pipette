FactoryGirl.define do

  factory :snippet do
    title "MyString"
    content "MyText"
    output "MyText"
    user
  end

end
