require File.join(File.dirname(__FILE__), 'spec_helper')
describe "intersect_with" do
  it "should return true when the sets do intersect" do
    [1,2,3,4,5].should intersect_with([3,4,5,6,7])
  end
  
  it "should return false when the sets do not intersect" do
     [1,2,3,4,5].should_not intersect_with([6,7, 8, 9, 10])
  end
  
end