require "test_helper"

class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.new(title: "Example Movie", description: "Description movie")
  end

  test "validar movie" do
    assert @movie.valid?
  end

  test "validando presencia titulo" do
    @movie.title = ""
    assert_not @movie.valid?
  end

  test "validando presencia descripcion" do
    @movie.description = ""
    assert_not @movie.valid?
  end

  test "validando asosiacion con generos" do
    assert_respond_to @movie, :genres
  end

  test "validando asosiacion con ratings" do
    assert_respond_to @movie, :ratings
  end

  test "validando imagen de cover" do
    assert_respond_to @movie, :cover
  end

  test "validando video" do
    assert_respond_to @movie, :video
  end
end
