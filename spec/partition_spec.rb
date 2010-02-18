require File.join(File.dirname(__FILE__), 'spec_helper')
describe "partition" do
  before(:all) do
    @kids = [:meadow, :aj]
    @parents = [:tony, :carmela]
    @aunts = [:barbara, :janice]
    @the_sopranos = @kids + @parents + @aunts
    @other_mobsters = [:al_capone, :john_dillinger]
    @mobsters = @the_sopranos + @other_mobsters
  end
  it "should return true when the first set is a set of sets that form a partition of the second" do
    [@kids, @parents, @aunts].should partition(@the_sopranos)
  end
  
  it "should return false when first set when the first set is a set of sets that does not cover the second" do
    [@kids, @parents, @aunts].should_not partition(@mobsters)
  end
  
  it "should return false when first set when the first set is a set of sets that contains any set with elements not in the second" do
    dishes = [:spaghetti_and_meatballs, :lasagna, :eggplant_parm]
    [dishes, @parents].should_not partition(@the_sopranos)
  end
  
  it "should return false when the first set is a set of sets, and any of the sets it includes intersect" do
    women = [:carmela, :barbara, :janice, :meadow]
    [@kids, @parents, @aunts, women].should_not partition(@the_sopranos)
  end
  
  it "should raise an error if the first set is not a set of sets" do
    lambda { @the_sopranos.should_not partition(@the_sopranos) }.should raise_error
  end
  
  
end