require 'rails_helper'

describe Room do
  it { should belong_to(:home) }
  it { should have_many(:temperatures) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :temp_setting }
end
