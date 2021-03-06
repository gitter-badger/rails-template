require "test_helper"

class JavascriptHelperTest < ActionView::TestCase
  include Sprockets::Rails::Helper
  include JavascriptHelper

  test "#javascript_include_async_tag doesn't do anything in debug mode" do
    stubs(:request_debug_assets?).returns(true)
    js_tag = javascript_include_tag("foo")
    js_async_tag = javascript_include_async_tag("foo")
    assert_equal(js_tag, js_async_tag)
  end

  test "javascript_include_async_tag adds async attribute" do
    assert_equal(
      '<script src="/javascripts/foo.js" async="async"></script>',
      javascript_include_async_tag("foo"))
  end
end
