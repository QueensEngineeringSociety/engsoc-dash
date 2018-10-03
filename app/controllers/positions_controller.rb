# frozen_string_literal: true

class PositionsController < ApplicationController
  load_and_authorize_resource

  # GET /positions/admin
  def admin
    @organizations = Organization.all
    @positions = Position.all.joins(:job).order('jobs.organization_id').reverse_order
  end

  # PUT /positions/edit
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
  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    flash[:success] = 'Position ' + @position.job.title + ' held by ' + @position.user.first_name + ' ' + @position.user.last_name + ' has been successfully deleted.'
    redirect_to admin_positions_path
  end

  private

  def position_params
    params.require(:position).permit(:start_date, :end_date, :id)
  end
end
