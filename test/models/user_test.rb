require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(email: "testemail3@gmail.com" ,encrypted_password: "$2a$12$20KBerIZvNkNSiD5KifJJeeFr/ttZLrm.E.Yl0JFJpYJPIs818d4y")
  end

  test "email debe estar presente" do
    @user.email = " "
    assert_not @user.valid?
  end

  test "email unico de usuario" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

  test "contrasena debe estar presente" do
    @user.password = " "
    assert_not @user.valid?
  end

  test "contrasena debe cumplir el minimo de largo" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end

  test "usuario tiene ratings" do
    assert_respond_to @user, :ratings
  end

end
