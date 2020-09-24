require 'rails_helper'

RSpec.describe Event, type: :feature do
  let(:user) { User.create(username: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { user.created_events.build(title: 'my first event reloaded', description: 'most fun filled event ever made', location: 'Los Angeless', date: '2020-07-09') }

  describe 'Load events index page', type: :system do
    describe 'Contents of the index page' do
      it 'shows the right content in the index page' do
        visit events_path
        expect(page).to have_content('All Events')
      end
    end
  end

  describe 'Event creation process', type: :feature do
    it 'create an event' do
      visit login_path
      fill_in 'Email', with: user.email
      click_button 'Login'
      click_on 'Create event'
      expect(page).to have_content('Private Event')
    end
  end
end