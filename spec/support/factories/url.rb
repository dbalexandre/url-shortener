FactoryGirl.define do
  factory :url do
    sequence(:url) { |n| "http://exemple#{n}.org" }
  end

  preload do
    factory(:google) {
      create(:url, :url => "http://www.google.com/")
    }
  end
end
