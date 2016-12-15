require 'spec_helper'

describe SshMessage do
  it 'has a version number' do
    expect(SshMessage::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
