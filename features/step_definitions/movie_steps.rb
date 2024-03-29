Given /^the following movies exist:$/ do |table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |movie|
    Movie.create! movie
  end
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  Movie.find_by_title(title).director.should == director
end

