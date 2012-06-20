require 'spec_helper'

describe MoviesController do
  describe 'find movies with same director' do
    before :each do
      @movie = FactoryGirl.build(:movie)
    end
    
    it 'should call the model method that search movies with given director' do
      
      Movie.should_receive(:find).with(@movie.id.to_s).and_return(@movie)
      @movie.should_receive(:find_with_same_director)

      get :same_director, {:id => @movie.id}
    end
    
    describe 'find movies with valid director' do
      before :each do
        Movie.stub(:find).and_return(@movie)
        @fake_movies = [FactoryGirl.build(:movie),FactoryGirl.build(:movie),FactoryGirl.build(:movie)]
        @movie.stub(:find_with_same_director).and_return(@fake_movies)
        get :same_director, {:id => @movie.id}
      end
      it 'should select the similar movies template for rendering' do
        response.should render_template('same_director')
      end
    
      it 'should make the search results available to that template' do
        assigns(:movies).should == @fake_movies
      end
      
      it 'should make the movie available to that template' do
        assigns(:movie).should == @movie
      end
    end
    
    describe 'find movies with empty director' do
      before :each do
        Movie.stub(:find).and_return(@movie)
        @movie.should_receive(:director?).and_return(false)
      end
      it 'should ask the model method if it has a director' do
        get :same_director, {:id => @movie.id}
      end
      
      it 'should not call model method that search movies with same director' do
        @movie.should_not_receive(:find_with_same_director)
        get :same_director, {:id => @movie.id}
      end
      it 'should redirect to the home page' do
        get :same_director, {:id => @movie.id}
        response.should redirect_to(movies_path)
      end
      it 'should make a message available to that action' do
        get :same_director, {:id => @movie.id}
        flash[:warning].should == "'#{@movie.title}' has no director info"
      end
    end    
  end
end