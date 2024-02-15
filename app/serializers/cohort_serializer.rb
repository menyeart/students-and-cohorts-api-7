class CohortSerializer
  include JSONAPI::Serializer
  attributes :name, :start_date, :graduation_date, :number_of_students, :status
end