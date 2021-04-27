feature 'Sign up' do
  scenario 'user can sign up' do
    visit('/user/new')
    fill_in('name', with: 'Alice')
    fill_in('email', with: 'alice@alice.com')
    fill_in('password', with: 'averygoodpassword')
    click_button('submit')
    expect(page).to have_content('you posted a new user! hi Alice :)')
  end
end
