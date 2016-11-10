class LabelsController < ApplicationController
  def show
    @label = Label.find(params[:id])
  end

  def new
    @label = Label.new
  end
end
