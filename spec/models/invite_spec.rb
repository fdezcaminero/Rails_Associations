# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe Invite, type: :model do
  context 'Checking for Validations on Invite Model' do
    let(:creator) { User.create!(username: 'johndoe', email: 'johndoe@example.com', password: 'azerty') }
    let(:attendee) { User.create!(username: 'janedoe', email: 'janedoe@example.com', password: 'azerty2') }
    let(:party) { creator.events.create!(name: "joe's disco party", location: 'Brazil', day: Date.today + 100, description: 'ultimate party') }
    let(:subject) { Invite.create!(attendee_id: attendee.id, attended_event_id: party.id) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a attendee_id' do
      subject.attendee_id = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a attended_event_id' do
      subject.attended_event_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    context 'Belonging to user model and the event model' do
      it { should belong_to(:attendee) }
      it { should belong_to(:attended_event) }
    end
  end
end

# rubocop:enable Layout/LineLength
