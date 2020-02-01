require 'rails_helper'

describe Temperature do
  it { should belong_to(:room)}
  it { should validate_presence_of :temperature }
end
