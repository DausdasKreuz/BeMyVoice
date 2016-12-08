require 'rails_helper'

# Devise attributes will not tested: email, password & password_confirmation
describe Disabled do
  it "is valid with a name and a professional_id"
  it "is invalid without a name"
  it "is invalid without a professional_id"
  it "is valid without a guide_id"
  it 
end
