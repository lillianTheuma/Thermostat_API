require 'rails_helper'

describe Home do
  it { should have_many(:rooms)}
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
end
