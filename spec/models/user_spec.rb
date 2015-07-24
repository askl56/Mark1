# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default("")
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  role                   :integer
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  invitations_count      :integer          default(0)
#  public                 :boolean          default(FALSE)
#

describe User do
  before(:each) { @user = create(:user) }

  subject { @user }

  it 'retrieves the like associated to a bookmark if present' do
    bookmark = create(:bookmark, user: @user)
    like = create(:like, user: @user, bookmark: bookmark)
    expect(@user.like_for(bookmark)).to eq(like)
  end

  it 'fails to retrieve the like associated to a bookmark without a like' do
    bookmark = create(:bookmark, user: @user)
    expect(@user.like_for(bookmark)).to eq(nil)
  end
end
