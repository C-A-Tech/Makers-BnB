# frozen_string_literal: true

xfeature 'Create listing' do
  scenario 'have feilds to create new listing' do
    visit('/create-listing')

    fill_in('Title', with: 'Nice Summer Home')
    fill_in('Description', with: '2 beds with paid wifi')
    fill_in('Location', with: 'London, UK')
    fill_in('price', with: 23)
    check('Monday')
    check('Friday')
    click_button('Submit')

    expect(current_path).to eq('/')
  end
end
