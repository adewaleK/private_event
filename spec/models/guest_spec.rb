RSpec.describe Guest, type: :model do
    let(:user) { User.create(username: 'joper', email: 'jsjs@jsjsee.com', password: 'passworddd') }
    let(:event) { Event.create(creator_id: user.id, title: 'my first event reloaded', description: 'most fun filled event ever made', location:'Abuja', date: '2020-07-09') }
    let(:guest) { event.guests.build(attendee_id: user.id) }
    context 'Validation' do
      it 'ensures that the user and event exist before they can attend event' do
        expect(guest.valid?).to eql(true)
      end
  
      it 'ensures that the user exist before they can attend event' do
        guest.attendee_id = 10
        expect(guest.valid?).to eql(false)
      end
  
      it 'ensures that the event exist before they can attend' do
        guest.event_id = 10
        expect(guest.valid?).to eql(false)
      end
    end
  
    context 'Associations' do
      it { should belong_to(:events_to_attend).class_name('Event') }
      it { should belong_to(:attendee).class_name('User') }
    end
  end