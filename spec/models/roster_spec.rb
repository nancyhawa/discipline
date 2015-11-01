require 'rails_helper'

RSpec.describe Roster, type: :model do
  before(:all) do
    @student1 = Student.create(first_name: 'Shawn',last_name: "Loize")
    @student2 = Student.create(first_name: 'Alisa',last_name: "Reyes")
    @student3 = Student.create(first_name: 'Tom',last_name: "Crowley")
    @student4 = Student.create(first_name: 'Connie',last_name: "Murren")
    @student5 = Student.create(first_name: 'Sarah',last_name: "Delbe")
    @roster = Roster.create(title: 'Testing Roster')
  end

  after(:all) do
    Student.destroy_all
    Roster.destroy_all
  end

  describe '#add_students' do
    context 'given an array of student ids' do
      it 'adds to a roster any students on the list' do
        @roster.add_students([@student1.id, @student3.id, @student5.id])
        expect(@roster.students.length).to eql(3)
        expect(@roster.students).to include(@student1)
        expect(@roster.students).to include(@student3)
        expect(@roster.students).to include(@student5)
      end
      it 'does not add students who are already on the list' do
        @roster.add_students([@student2.id, @student5.id])
        expect(@roster.students.length).to eql(4)
        expect(@roster.students.uniq.length).to eql(4)
        expect(@roster.students).to include(@student2)
      end
    end
  end

  describe '#remove_students' do
    context 'given an array of student ids as integers' do
      it 'removes from a roster any students who are not on the list' do
        @roster.remove_students([@student1.id, @student3.id])
        expect(@roster.students.length).to eql(2)
        expect(@roster.students).to include(@student1)
        expect(@roster.students).to include(@student3)
        expect(@roster.students).not_to include(@student2)
        expect(@roster.students).not_to include(@student4)
        expect(@roster.students).not_to include(@student5)
      end
    end

    context 'given an array of student ids as strings' do
      it 'removes from a roster any students who are not on the list' do
        @roster.remove_students(["#{@student1.id}", "#{@student3.id}"])
        expect(@roster.students.length).to eql(2)
        expect(@roster.students).to include(@student1)
        expect(@roster.students).to include(@student3)
        expect(@roster.students).not_to include(@student2)
        expect(@roster.students).not_to include(@student4)
        expect(@roster.students).not_to include(@student5)
      end
    end
  end

  describe '#update_students' do
    context 'given an array of student ids as integers' do
      it 'updates the roster to include only the students in the array' do
        @roster.update_students(["#{@student2.id}", "#{@student4.id}", "#{@student3.id}"])
        expect(@roster.students.length).to eql(3)
        expect(@roster.students).to include(@student2)
        expect(@roster.students).to include(@student3)
        expect(@roster.students).to include(@student4)
        expect(@roster.students).not_to include(@student1)
        expect(@roster.students).not_to include(@student5)
      end
    end
  end

end
