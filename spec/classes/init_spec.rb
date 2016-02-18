require 'spec_helper'
describe 'hostkey' do

  context 'with defaults for all parameters' do
    it { should contain_class('hostkey') }
  end
end
