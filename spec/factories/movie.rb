FactoryGirl.define do
  factory :movie do
    title 'Star Wars'
    director 'George Lucas'
    rating 'PG'
    release_date { 10.years.ago }
    id "123"
  end
end