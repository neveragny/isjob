require 'spec_helper'

describe Position do
  before(:each) do

    @user_attr = {
      :name => 'Alfred',
      :email => 'some@some.com',
      :password => 'foobar',
      :password_confirmation => 'foobar'
    } 

    @p_attr = {
      :title => "some good title CV",
      :description => "also descriptio",
      :level => "100500",
      :region_id => 1
    }
  end

  it "should create a new instance of position" do
    Position.create!(@p_attr)
  end

  it "should require a title" do
    no_title = Position.new(@p_attr.merge(:title => ""))
    no_title.should_not be_valid
  end

end
