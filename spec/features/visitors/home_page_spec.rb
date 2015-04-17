feature 'Home page' do
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'Mark1'
  end

  scenario 'look to log in' do
  	visit root_path
  	expect(page).to have_content 'Sign in'
  end

  scenario 'view jumbotron' do 
  	visit root_path
  	expect(page).to have_content 'Already have an account?'
  end
end
