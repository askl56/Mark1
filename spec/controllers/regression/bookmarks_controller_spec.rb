require 'rails_helper'

RSpec.describe BookmarksController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/bookmarks').to('bookmarks#index', {}) }
  it { should route(:post, '/topics/1/bookmarks').to('bookmarks#create', topic_id: '1') }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
