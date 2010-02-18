Spec::Matchers.define :intersect_with do |challenge_range|
  
  #based on http://gist.github.com/247669, but using Enumerable#select rather than '&', for compatibility with all enumerables (Enumerable doesn't implement &).
  
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


Spec::Matchers.define :partition do |partitioned_set|
    match do |partitioning_sets|
      entries = partitioning_sets.map {|s| s.entries}
      entries.zip(entries[1..-1]).map {|a1,a2| a1.should_not intersect_with(a2 || []) }.inject(true) {|m, n| m && n }
      all_entries = entries.inject([]) {|m, n| m + n}
      all_entries.map {|e| partitioned_set.entries.include?(e) }.inject(true) {|m, n| m && n } && partitioned_set.entries.map {|e| all_entries.include?(e) }.inject(true) {|m, n| m && n } 
    end
    
    failure_message_for_should do |partitioned_set|
      "#{partitioning_sets.inspect} does not partition #{partitioned_set.inspect}"
    end

    failure_message_for_should_not do |partitioning_sets|
      "#{partitioning_sets.inspect} partitions #{partitioned_set.inspect}"
    end

    description do
      "assert that a set of sets partitions a second set"
    end
  end
