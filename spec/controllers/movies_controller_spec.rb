require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    it 'should call the model method that search movies with given director' do
      movie = FactoryGirl.build(:movie)
      fake_results = [FactoryGirl.build(:movie), FactoryGirl.build(:movie)]

      Movie.should_receive(:find).with(movie.id.to_s).and_return(movie)
      movie.should_receive(:find_with_same_director).and_return(fake_results)

      post :same_director, {:id => movie.id}
    end
    it 'should select the similar movies template for rendering'
    it 'should make the search results to that template'
  end
end