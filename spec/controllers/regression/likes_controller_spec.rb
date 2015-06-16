require 'rails_helper'

RSpec.describe LikesController, regressor: true do
  # === Routes (REST) ===
  it { should route(:post, '/bookmarks/1/likes').to('likes#create', bookmark_id: '1') }
  it { should route(:delete, '/bookmarks/1/likes/1').to('likes#destroy', bookmark_id: '1', id: '1') }
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:configure_permitted_parameters) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:load_bookmark_and_like) }
  # === Callbacks (After) ===
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:abort_xdomain_redirect) }
  # === Callbacks (Around) ===
end
