require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new({name:'juan', email: 'juan@juan.com'})
  end

  test "model validations" do
    duplicated_user = @user.dup
    duplicated_user.email = @user.email.upcase
    @user.save
    assert_not duplicated_user.valid?
  end
end
