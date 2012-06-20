require 'spec_helper'

describe Movie do
  describe 'find movies with same director' do
    it 'should call find method on Movie class with director' do
      movie = FactoryGirl.build(:movie)
      Movie.should_receive(:find_all_by_director).with(hash_including :director => 'George Lucas')
      movie.find_with_same_director
    end
  end
end