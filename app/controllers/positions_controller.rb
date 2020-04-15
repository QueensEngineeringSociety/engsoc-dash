# frozen_string_literal: true

#This controller is for Admin->Positions which allows an admin to manage position information for job postings. Positions are created by organizations
#See views/positions for the html

class PositionsController < ApplicationController
  load_and_authorize_resource

  # GET /positions/admin
  #Admin shows all of the different positions and organizations and allows you to click on them to edit them.
  def admin
    @organizations = Organization.all
    @positions = Position.all.joins(:job).order('jobs.organization_id').reverse_order
  end

  # PUT /positions/edit
  #For when a position is edited and saved (i.e. updated)
  def update
    position = Position.find(position_params[:id])
    if position.update_attributes(position_params)
      flash[:success] = 'Position ' + position.job.title + ' held by ' + position.user.first_name + ' ' + position.user.last_name + ' has been updated.'
    else
      flash.keep[:danger] = 'Could not update position ' + position.job.title + ' held by ' + position.user.first_name + ' ' + position.user.last_name + '.'
      flash[:danger] << '<li>' + position.errors.full_messages.join('</li><li>')
      flash[:danger] << '</ul>'
    end
    redirect_to admin_positions_path
  end

  # DESTROY /positions/:id
  #For deleting positions
  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    flash[:success] = 'Position ' + @position.job.title.to_s + ' held by ' + @position.user.first_name.to_s + ' ' + @position.user.last_name.to_s + ' has been successfully deleted.'
    redirect_to admin_positions_path
  end

  private

  def position_params
    params.require(:position).permit(:start_date, :end_date, :id)
  end
end
