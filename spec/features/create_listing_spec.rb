feature 'Create listing' do
  scenario 'have feilds to create new listing' do
    visit('/create-listing')

    fill_in('Title', with: 'Nice Summer Home')
    fill_in('Description', with: '2 beds with paid wifi')
    fill_in('Location', with: 'London, UK')
    fill_in('Price', with: 23)
    check('Monday')
    check('Friday')
    click_button('Submit')

    expect(current_path).to eq('/home')
    expect(page).to have_content('Nice Summer Home')
    expect(page).to have_content('2 beds with paid wifi')
    expect(page).to have_content('London, UK')
    expect(page).to have_content('£23 per night')
  end
end