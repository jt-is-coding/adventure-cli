require "./adventure"
require "minitest/autorun"


class TestCreateAdventurer < Minitest::Test
# A simple test to verify that new_guy is empty on a fresh run, so that Load my Adventurer produces "There's no Adventurer to load, buddy." instead of starting trying to start a campaign with an empty name and job 
  def test_initialize_new_guy
    adventure = Adventure.new
    assert_equal "", "#{adventure.new_guy.name}" "#{adventure.new_guy.job}", "new_guy should be blank"
  end
end
