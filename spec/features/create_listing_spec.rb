feature 'Create listing' do
  scenario 'have feilds to create new listing' do
    visit('/create-listing')

    fill_in('Title', with: 'Nice Summer Home')
    fill_in('Description', with: '2 beds with paid wifi')
    fill_in('price', with: 23)
    check('Monday')
    click_button('Submit')

    expect(current_path).to eq('/dummyHomePage')
  end
end