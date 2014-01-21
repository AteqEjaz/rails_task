require 'spec_helper'

feature 'It saves a new charge record in datavase', js: true do

  scenario 'save Charge object' do

    visit '/charges/new'
    fill_in 'charge_amount', with: 2222
    # Still pending due to time limitation

  end
end