Spec::Matchers.define :intersect_with do |challenge_range|
  
  #based on http://gist.github.com/247669, but using Enumerable#select rather than '&', for compatibility with all enumerables (Enumerable doesn't implement &lo).
  
  match do |current_range|
    !current_range.select {|element| challenge_range.include?(element)}.empty?
  end
  
  failure_message_for_should do |current_range|
    "#{current_range.inspect} doesn't overlap with #{challenge_range.inspect}"
  end
 
  failure_message_for_should_not do |current_range|
    "#{current_range.inspect} overlaps with #{challenge_range.inspect}"
  end
 
  description do
    "intersection of an enumerable's elements"
  end
  
end

Spec::Matchers.define :be_a_subset_of do |challenge_range|
  
  
  match do |current_range|
    current_range.map {|element| challenge_range.include?(element)}.inject(true) {|m,n| m && n}
  end
  
  failure_message_for_should do |current_range|
    "#{current_range.inspect} is a subset of #{challenge_range.inspect}"
  end
 
  failure_message_for_should_not do |current_range|
    "#{current_range.inspect} is not a subset of #{challenge_range.inspect}"
  end
 
  description do
    "compare subsets"
  end
  
end


Spec::Matchers.define :be_a_proper_subset_of do |challenge_range|
  
  
  match do |current_range|
    current_range.map {|element| challenge_range.include?(element)}.inject(true) {|m,n| m && n} && !challenge_range.map {|element| current_range.include?(element)}.inject(true) {|m,n| m && n}
  end
  
  failure_message_for_should do |current_range|
    "#{current_range.inspect} is a proper subset of #{challenge_range.inspect}"
  end
 
  failure_message_for_should_not do |current_range|
    "#{current_range.inspect} is not a proper subset of #{challenge_range.inspect}"
  end
 
  description do
    "compare proper subsets"
  end
  
end
