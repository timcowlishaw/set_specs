require File.join(File.dirname(__FILE__), 'spec_helper')

describe "be_a_subset_of" do
  it "should return true when the first set is a subset of the second" do
    [1,2,3].should be_a_subset_of([1,2,3,4,5])
  end
  
  it "should return false when the first set has no elements in common with the second" do
    [1,2,3].should_not be_a_subset_of([4,5,6])
  end

  it "should return false when the first set intersects with the second, but is not a subset" do
    [1,2,3].should_not be_a_subset_of([2,3,4,5,6])
  end
  
  it "should return true when the first set is equivalent to the second" do
    [1,2,3].should be_a_subset_of([1,2,3])
  end

end