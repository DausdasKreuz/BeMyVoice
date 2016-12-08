require 'rails_helper'

# Devise attributes will not tested: email, password & password_confirmation
describe User do
  it "is valid with a name and a professional_status" do
    user = User.new(name: 'Dani Garcia',  email: 'dani@soy.yo', password: 'secret', password_confirmation: 'secret')
    expect(user).to be_valid
  end

  it "is invalid without a name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "name can't be a whitespace" do
    user = User.new(name: "\s")
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "professional_status is true by default" do
    user = User.new
    expect(user.professional).to be true
  end

  it "is valid with a professional_status true" do
    user = User.new(professional: true)
    user.valid?
    expect(user.errors[:professional]).to eq []
  end

  it "is valid with a professional_status false" do
    user = User.new(professional: false)
    user.valid?
    expect(user.errors[:professional]).to eq []
  end

  it "professional_status couldn't be nil" do
    user = User.new(professional: nil)
    user.valid?
    expect(user.errors[:professional]).to include("is not included in the list")
  end
end
