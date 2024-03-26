require "test_helper"

class GenreTest < ActiveSupport::TestCase
  test "pertenecer a varias movies" do
    genre = Genre.new
    assert_respond_to genre, :movies
  end

end
