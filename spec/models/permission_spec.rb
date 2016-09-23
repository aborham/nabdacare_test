require 'spec_helper'

describe Permission do
  before { @permission = FactoryGirl.build(:permission) }

  subject { @permission }

  it { should respond_to(:name) }
  it { should respond_to(:level) }

  it { should be_valid }

  describe "when name is not present" do
    before { @permission.name = " " }
    it { should_not be_valid }
  end

  describe "when level is not present" do
    before { @permission.level = nil }
    it { should_not be_valid }
  end


  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:level) }
  it { should validate_uniqueness_of(:name) }
end
