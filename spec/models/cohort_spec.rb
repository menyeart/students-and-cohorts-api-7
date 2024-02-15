require 'rails_helper'

RSpec.describe Cohort, type: :model do

  describe 'relationships' do
    it { should have_many(:students) }
  end

  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:graduation_date) }
  end 

  describe 'methods' do
    it "#number_of_students" do
      cohort_1 = Cohort.create!(name: "2107 BE", start_date: Date.today, graduation_date: Date.today + 1 )
      jessie = Student.create!(first_name: "Jessie", last_name: "Smith", preferred_name: "Jess", pronouns: "xe/xem", email: "jessie@email.com", github_username: "Jessie_gitub", slack_username: "Jessie_slack", cohort_id: cohort_1.id)

      expect(cohort_1.number_of_students).to eq(1)

      matt = Student.create!(first_name: "matt", last_name: "e", preferred_name: "matty", pronouns: "xe/xem", email: "matt@email.com", github_username: "matt_gitub", slack_username: "matt_slack", cohort_id: cohort_1.id)

      expect(cohort_1.number_of_students).to eq(2)
    end

    it "#status" do
      cohort_1 = Cohort.create!(name: "2107 BE", start_date: Date.today, graduation_date: Date.today + 5 )
      cohort_2 = Cohort.create!(name: "2207 BE", start_date: Date.today, graduation_date: Date.today - 5 )

      expect(cohort_1.status).to eq("current")
      expect(cohort_2.status).to eq("graduated")
    end
  end

end 