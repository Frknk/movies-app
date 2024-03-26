require "test_helper"

class RatingTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.create(title: "Example Movie")
    @user = User.create(email: "testemail3@gmail.com" ,encrypted_password: "$2a$12$20KBerIZvNkNSiD5KifJJeeFr/ttZLrm.E.Yl0JFJpYJPIs818d4y")
    @rating = Rating.new(value: 4, user: @user, movie: @movie)
  end

  test "rating valido" do
    assert @rating.valid?
  end

  test "valor presente en rating" do
    @rating.value = nil
    assert_not @rating.valid?
  end

  test "valor entre 1 y 5" do
    @rating.value = 0
    assert_not @rating.valid?

    @rating.value = 6
    assert_not @rating.valid?

    @rating.value = 3
    assert @rating.valid?
  end
end
