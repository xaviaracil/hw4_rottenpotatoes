require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    it 'should call the model method that search movies with given director' do
      post :same_director, {:id => 1}
    end
    it 'should select the similar movies template for rendering'
    it 'should make the search results to that template'
  end
end