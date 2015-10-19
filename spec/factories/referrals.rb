FactoryGirl.define do
  factory :referral do
    student nil
staff_member nil
positive? false
type ""
anecdotal "MyText"
additional_information "MyText"
points 1
date "2015-10-19"
deans_referral? false
period "MyString"
integer "MyString"
location "MyString"
  end

end
