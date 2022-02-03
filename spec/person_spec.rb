require_relative '../person'

describe Person do
  context 'when testing the student class' do
    before(:each) do
      @person = Person.new('Yaseer', 90)
    end

    it 'should initialize a person object with a name, age and parent permission' do
      expect(@person.name).to eq('Yaseer')
      expect(@person.age).to eq(90)
      expect(@person.parent_permission).to eq({ parent_permission: true })
    end

    it 'has age to be an integer' do
      expect(@person.age).to be_kind_of Numeric
    end

    it 'person should have empty rentals array' do
      expect(@person).to have_attributes('rentals' => [])
    end
  end
end
