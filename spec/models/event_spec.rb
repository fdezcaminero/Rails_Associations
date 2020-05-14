require 'date'
require 'rails_helper'

RSpec.describe Event, type: :model do
  context "Checking for Validations on Event Model" do
    let(:creator) { User.create!(username:"johndoe", email:"johndoe@example.com",password:"azerty")}
    let(:subject) { creator.events.create!(name:"joe", location:"Brazil", day: Date.today + 100, description: "ultimate party") }

    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name  = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a location" do
      subject.location  = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a date" do
      subject.day  = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
        subject.description  = nil
        expect(subject).to_not be_valid
      end
  end

  describe "Associations" do
    context "Belonging to user model" do
        it { should belong_to(:creator) }
    end
    context "Having many from the different existent models" do
      it { should have_many(:invites) }
      it { should have_many(:attendees) }
    end
  end

end


