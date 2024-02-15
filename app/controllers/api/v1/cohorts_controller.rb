class Api::V1::CohortsController < ApplicationController

  def show
    cohort = Cohort.find(params[:id])
    render json: CohortSerializer.new(cohort)
  end

end