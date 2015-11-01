require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'attributes' do
    date = Date.new(1983, 6, 26)
    let(:student) { Student.new(first_name: 'Shawn',
                            last_name: "Loize",
                            osis_number: '123-456-789',
                            grade: 8,
                            meal_code: 2,
                            birthdate: date,
                            school_id: 1,
                            phone: "(555) 646-1481" )
                          }

    describe "#first_name" do
      it 'returns the first name of a student' do
        expect(student.first_name).to eq('Shawn')
      end
    end
    describe "#last_name" do
      it 'returns the last name of a student' do
        expect(student.last_name).to eq('Loize')
      end
    end
    describe "#osis_number" do
      it 'returns the osis number of a student' do
        expect(student.osis_number).to eq('123-456-789')
      end
    end
    describe "#grade" do
      it 'returns the grade of a student' do
        expect(student.grade).to eq(8)
      end
    end
    describe "#meal_code" do
      it 'returns the meal code of a student' do
        expect(student.meal_code).to eq(2)
      end
    end
    describe "#birthdate" do
      it 'returns the birthdate of a student' do
        expect(student.birthdate).to eq(date)
      end
    end
    describe "#full_name" do
      it 'returns the full_name of a student' do
        expect(student.full_name).to eq('Shawn Loize')
      end
    end
  end
end
