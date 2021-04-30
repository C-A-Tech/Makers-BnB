# frozen_string_literal: true

feature 'Make Booking' do
  scenario 'user can click bookings button' do
    # stealing this from another test lol
    # we get to a confirmation page when we click

    # update test so that it clicks (the first) button
    # and the resulting page links to the new page booking's id.
    visit('/create-listing')
    fill_in('Title', with: 'Nice Summer Home')
    fill_in('Description', with: '2 beds with paid wifi')
    fill_in('Location', with: 'London, UK')
    fill_in('Price', with: 23)

    click_button('Submit')
    # go to /home, sees all listings.
    click_button('book')
    # save_and_open_page
    expect(current_path).to eq('/booking/new')
    # expect(page).to have_content('welcome')
    check('Friday')
    check('Wednesday')
    click_button('Submit')
    expect(current_path).to eq('/booking/confirmed')
    expect(page).to have_content('Friday')
    expect(page).to have_content('Wednesday')
  end
end
