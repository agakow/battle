feature 'Attack' do
  scenario 'attack player 2' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Aga attacked Tommy'
  end

  scenario 'reduce player 2 hit points' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'OK'
    expect(page).not_to have_content 'Tommy: 100'
    expect(page).to have_content 'Tommy: 90'
  end

  scenario 'reduce player 2 hit points' do
    sign_in_and_play
    click_button 'Attack'
    click_link 'OK'
    click_button 'Attack'
    expect(page).to have_content 'Tommy attacked Aga'
  end
end
