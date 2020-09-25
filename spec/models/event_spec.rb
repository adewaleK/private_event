require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create(username: 'keller', email: 'jsjs@jsjsee.com', password: 'passworddd') }
  let(:event) { user.created_events.build(title: 'my first event', description: 'best event of the year', location: 'London', date: '2020-07-09') }

  context 'Validation' do
    it 'ensures the user is signed in and the event has a creator' do
      expect(event.valid?).to eql(true)
    end

    it 'it is invalid if user is not signed in' do
      event.creator_id = 5
      expect(event.valid?).to eql(false)
    end

    it "create an event with it's attributes" do
      event.title = 'first event'
      expect(event).to have_attributes(title: 'first event')
    end

    it "Should validates presence of title" do
      event.title = nil
      expect(event.valid?).to eql(false)
    end

    it "Should validates presence of date" do
      event.date = nil
      expect(event.valid?).to eql(false)
    end
  end

  context 'Associations' do
    it { should belong_to(:creator).class_name('User') }
    it { should have_many(:guests) }
    it { should have_many(:attendees).through(:guests) }
  end
end
