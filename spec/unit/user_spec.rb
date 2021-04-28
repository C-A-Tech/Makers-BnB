# frozen_string_literal: true

require 'user'

describe User do
  let(:subject) do
    described_class.new(
      id: 99, # added by jess
      first_name: 'Bob',
      last_name: 'Ross',
      email: 'bob@ross.com',
      password: 'happyliltrees'
    )
  end

  it { is_expected.to respond_to :first_name }
  it { is_expected.to respond_to :last_name }
  it { is_expected.to respond_to :email }
  it { is_expected.to respond_to :password }

  describe 'intitalize' do
    context 'creating a new user' do
      it 'returns the name of the user' do
        expect(subject.first_name).to eq 'Bob'
      end
      it 'returns the name of the user' do
        expect(subject.last_name).to eq 'Ross'
      end
      it 'returns the name of the user' do
        expect(subject.email).to eq 'bob@ross.com'
      end
      it 'returns the name of the user' do
        expect(subject.password).to eq 'happyliltrees'
      end
    end
  end

  describe '.create' do
    context 'adding a user to the database' do
      it 'creates a new user first name' do
        user = User.create(
          first_name: 'Bob',
          last_name: 'Ross',
          email: 'bob@ross.com',
          password: 'happyliltrees'
        )
        expect(user.first_name).to eq 'Bob'
        expect(user.last_name).to eq 'Ross'
        expect(user.email).to eq 'bob@ross.com'
        expect(user.password).to eq 'happyliltrees'
      end
    end
  end
end
