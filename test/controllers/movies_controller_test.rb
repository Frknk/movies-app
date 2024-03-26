require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie = Movie.create!(title: "Title #{Time.now.to_i}", description: "Description #{Time.now.to_i}")
  end

  test "Obtener movie index" do
    get movies_url
    assert_response :success
  end

  test "Obtener url de nueva movie" do
    get new_movie_url
    assert_response :success
  end

  test "Crear movie" do
    assert_difference("Movie.count") do
      post movies_url, params: { movie: { description: "Description1", title: "Title1" } }
    end

    assert_redirected_to movie_url(Movie.last)
  end

  test "Mostrar movie" do
    get movie_url(@movie)
    assert_response :success
  end

  test "Get a url de movie edit" do
    get edit_movie_url(@movie)
    assert_response :success
  end

  test "Update movie con params" do
    patch movie_url(@movie), params: { movie: { description: @movie.description, title: @movie.title } }
    assert_redirected_to movie_url(@movie)
  end

  test "Destruir movie" do
    assert_difference("Movie.count", -1) do
      delete movie_url(@movie)
    end

    assert_redirected_to movies_url
  end

  test "No crear movie vacia" do
    movie = Movie.new
    assert_not movie.save
  end

  test "No crear movie sin titulo" do
    movie = Movie.new(description: "Description")
    assert_not movie.save
  end
end
