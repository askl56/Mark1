describe User do

  before(:each) { @user = create(:user) }

  subject { @user }

  it 'retrieves the like associated to a bookmark if present' do
    bookmark = create(:bookmark, :user => @user)
    like = create(:like, :user => @user, :bookmark => bookmark)
    expect(@user.like_for(bookmark)).to eq(like)
  end


  it 'fails to retrieve the like associated to a bookmark without a like' do
    bookmark = create(:bookmark, :user => @user)
    expect(@user.like_for(bookmark)).to eq(nil)
  end

end
