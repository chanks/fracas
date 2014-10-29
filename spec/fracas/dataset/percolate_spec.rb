require 'spec_helper'

describe Fracas::Dataset, "#percolate" do
  it "when matching percolators are defined should return those percolators" do
    FTS.from_index('my_index').filter(number: 5).add_percolator('my_percolator')

    proc { FTS.from_index('index1', 'index2').filter(number: 5).add_percolator('my_percolator') }.should raise_error RuntimeError, /Need exactly one index for a percolator/
    proc { FTS.filter(number: 5).add_percolator('my_percolator') }.should raise_error RuntimeError, /Need exactly one index for a percolator/

    FTS.from_index('my_index').percolate(number: 5).should == ['my_percolator']
  end
end