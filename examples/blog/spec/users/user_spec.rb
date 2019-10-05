require 'spec_helper'

describe Blog::Domain::Users::User do
  subject { described_class.new(name: nil) }

  describe '#update_name' do
    it do
      subject.update_name!(name: 'Dog')
      expect(subject.name).to eq('Dog')
    end
  end
end