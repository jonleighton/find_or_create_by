require File.dirname(__FILE__) + '/test_helper'

class Model
  extend ActiveRecord::FindOrCreateBy
end

class FindOrCreateByTest < ActiveSupport::TestCase
  def setup
    @conditions, @record = stub, stub
  end

  test "#find_or_create_by should return the record if found" do
    Model.stubs(:find).with(:first, :conditions => @conditions).returns(@record)
    assert_equal @record, Model.find_or_create_by(@conditions)
  end

  test "#find_or_create_by! should return the record if found" do
    Model.stubs(:find).with(:first, :conditions => @conditions).returns(@record)
    assert_equal @record, Model.find_or_create_by!(@conditions)
  end

  test "#find_or_create_by should create the record if not found" do
    Model.stubs(:find).with(:first, :conditions => @conditions).returns(nil)
    Model.stubs(:create).with(@conditions).returns(@record)
    assert_equal @record, Model.find_or_create_by(@conditions)
  end

  test "#find_or_create_by! should create! the record if not found" do
    Model.stubs(:find).with(:first, :conditions => @conditions).returns(nil)
    Model.stubs(:create!).with(@conditions).returns(@record)
    assert_equal @record, Model.find_or_create_by!(@conditions)
  end
end
