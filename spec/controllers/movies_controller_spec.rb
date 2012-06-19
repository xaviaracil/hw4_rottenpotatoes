require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    before :each do
      @movie = FactoryGirl.build(:movie)
    end
    
    it 'should call the model method that search movies with given director' do
      
      Movie.should_receive(:find).with(@movie.id.to_s).and_return(@movie)
      @movie.should_receive(:find_with_same_director)

      post :same_director, {:id => @movie.id}
    end
    
    it 'should select the similar movies template for rendering' do
      
      Movie.stub(:find).and_return(@movie)
      @movie.stub(:find_with_same_director)
      
      post :same_director, {:id => @movie.id}
      response.should render_template('same_director')
    end
    
    it 'should make the search results to that template'
  end
end