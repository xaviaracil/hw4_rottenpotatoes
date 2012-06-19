require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    it 'should call the model method that search movies with given director' do
      movie = FactoryGirl.build(:movie)
      Movie.should_receive(:find_movie_with_same_director).with(movie.id)
      post :same_director, {:id => movie.id}
    end
    it 'should select the similar movies template for rendering'
    it 'should make the search results to that template'
  end
end