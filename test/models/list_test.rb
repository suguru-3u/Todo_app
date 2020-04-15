require 'test_helper'

class ListTest < ActiveSupport::TestCase
  test "title,body should be present (nonblank)" do
    @list = List.new(title:'',body:'')
    assert_not @list.valid?
  end
end
