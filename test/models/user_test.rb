require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: 'Example User', email: 'user@example.com',
                     password: 'foobar', password_confirmation: 'foobar')
    @event = Event.new(title: 'event1', description: 'description',
                       date: '05-02-2020', location: 'location')
  end

  test 'username should be present' do
    @user.username = ' '
    assert @user.valid?
  end
end
