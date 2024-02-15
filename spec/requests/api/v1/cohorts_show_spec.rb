require "rails_helper"

RSpec.describe "Cohort Show Endpoint", type: :request do 
  it "can get get a single cohort" do
    cohort_1 = Cohort.create!(name: "2107 BE", start_date: Date.today, graduation_date: Date.today + 1 )
    jessie = Student.create!(first_name: "Jessie", last_name: "Smith", preferred_name: "Jess", pronouns: "xe/xem", email: "jessie@email.com", github_username: "Jessie_gitub", slack_username: "Jessie_slack", cohort_id: cohort_1.id)

    get "/api/v1/cohorts/#{cohort_1.id}"

    cohort = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(cohort).to be_a(Hash)
    expect(cohort[:data][:id]).to eq(cohort_1.id.to_s)
    expect(cohort[:data][:type]).to eq("cohort")
    expect(cohort[:data][:attributes][:name]).to eq(cohort_1.name)
    expect(cohort[:data][:attributes][:start_date]).to eq(cohort_1.start_date.to_s)
    expect(cohort[:data][:attributes][:graduation_date]).to eq(cohort_1.graduation_date.to_s)
    expect(cohort[:data][:attributes][:number_of_students]).to eq(cohort_1.students.count)
    expect(cohort[:data][:attributes][:status]).to eq(cohort_1.status)
  end

end