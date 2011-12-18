require 'spec_helper'

describe PositionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get 'update'
      response.should be_success
    end
  end

  describe "GET 'delete'" do
    it "returns http success" do
      get 'delete'
      response.should be_success
    end
  end

  describe "GET 'activate'" do
    it "returns http success" do
      get 'activate'
      response.should be_success
    end
  end

  describe "GET 'deactivate'" do
    it "returns http success" do
      get 'deactivate'
      response.should be_success
    end
  end

end
