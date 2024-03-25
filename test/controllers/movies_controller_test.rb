require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @genre = Genre.create!(name: "Genre #{Time.now.to_i}")
    @movie = movies(:one)
  end

  test "should get index" do
    get movies_url
    assert_response :success
  end
end
