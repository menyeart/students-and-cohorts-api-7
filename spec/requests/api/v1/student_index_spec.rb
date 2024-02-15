require 'rails_helper'

RSpec.describe "Student index endpoint", type: :request do
  it "can get all students" do
    cohort_1 = Cohort.create!(name: "2107 BE", start_date: Date.today, graduation_date: Date.today + 1 )
    jessie = Student.create!(first_name: "Jessie", last_name: "Smith", preferred_name: "Jess", pronouns: "xe/xem", email: "jessie@email.com", github_username: "Jessie_gitub", slack_username: "Jessie_slack", cohort_id: cohort_1.id)

    get "/api/v1/students"

    students = JSON.parse(response.body, symbolize_names: true)
    student = students[:data].first

    expect(response).to be_successful
    expect(students).to be_a(Hash)
    expect(students[:data]).to be_a(Array)
    expect(student[:id]).to eq(jessie.id.to_s)
    expect(student[:type]).to eq("student")
    expect(student[:attributes][:first_name]).to eq(jessie.first_name)
    expect(student[:attributes][:last_name]).to eq(jessie.last_name)
    expect(student[:attributes][:preferred_name]).to eq(jessie.preferred_name)
    expect(student[:attributes][:pronouns]).to eq(jessie.pronouns)
    expect(student[:attributes][:email]).to eq(jessie.email)
    expect(student[:attributes][:github_username]).to eq(jessie.github_username)
    expect(student[:attributes][:slack_username]).to eq(jessie.slack_username)
  end
end