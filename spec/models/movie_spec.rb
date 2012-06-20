require 'spec_helper'

describe Movie do
  describe 'find movies with same director' do
    before :each do
      @movie = FactoryGirl.build(:movie)
    end
    it 'should call find method on Movie class with director' do
      Movie.should_receive(:find_all_by_director).with(hash_including :conditions => hash_including(:director => 'George Lucas'))
      @movie.find_with_same_director
    end
    it 'should return an empty array if movie hasn\'t any director' do
      @movie.find_with_same_director.should be_empty
    end
  end
end