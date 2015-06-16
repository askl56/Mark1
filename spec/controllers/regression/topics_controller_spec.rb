require 'rails_helper'

RSpec.describe TopicsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/topics').to('topics#index', {}) }
  it { should route(:get, '/topics/1').to('topics#show', id: '1') }
  it { should route(:get, '/topics/new').to('topics#new', {}) }
  it { should route(:get, '/topics/1/edit').to('topics#edit', id: '1') }
  it { should route(:post, '/topics').to('topics#create', {}) }
  it { should route(:patch, '/topics/1').to('topics#update', id: '1') }
  it { should route(:delete, '/topics/1').to('topics#destroy', id: '1') }
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
