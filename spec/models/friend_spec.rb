require 'spec_helper'

describe Friend do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }

  it "lives on a unique place" do
    FactoryGirl.create(:friend, :latitude => -17.88888, :longitude => -48.785968)
    friend = FactoryGirl.build(:friend, :latitude => -17.88888, :longitude => -48.785968)
    expect(friend).to have(1).error_on(:base)
  end

  it "returns 3 closests friends" do
    5.times { |n| FactoryGirl.create(:friend, :latitude => n+10.0, :longitude => n+5.0 ) }
    me = Friend.first
    friends = ['Friend 2','Friend 3','Friend 4']
    expect(Friend.closests(me).map(&:name)).to eql(friends)
  end
end
