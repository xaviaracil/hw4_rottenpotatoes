Given /^the following movies exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
    Movie.create! movie
  end
end
