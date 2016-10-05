require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:username).when('coolCat', 'coolCat1') }
  it { should_not have_valid(:username).when(nil, "") }

  it { should have_valid(:email).when('email@gmail.com', 'emailmail@gmail.com') }
  it { should_not have_valid(:email).when(nil, '', 'madhnl', 'mail.com', '@') }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'differentpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
