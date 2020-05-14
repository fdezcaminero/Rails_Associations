require 'rails_helper'

RSpec.describe User, type: :model do
  context "Checking for Validations" do
    let(:subject) { User.create!(username:"johndoe", email:"johndoe@example.com",password:"azerty")}

    it "is valid with valid attributes" do 
      expect(subject).to be_valid
    end

    it "is not valid without a username" do
      subject.username  = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email  = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a password" do
      subject.password  = nil
      expect(subject).to_not be_valid
    end
  end

  describe "Associations" do
    context "Having many from the different existent models" do
      it { should have_many(:events) }
      it { should have_many(:invites)}
      it { should have_many(:attended_events)}
    end
  end

end


