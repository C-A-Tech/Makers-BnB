feature 'Sign up' do
  scenario 'user can sign up' do
    visit('/user/new')
    save_and_open_page
    fill_in('name', with: 'Alice')
    fill_in('email', with: 'alice@alice.com')
    fill_in('password', with: 'averygoodpassword')
    click_button('submit')
    save_and_open_page
    expect(page).to have_content('welcome, Alice')
  end
end
