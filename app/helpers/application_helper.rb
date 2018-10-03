# frozen_string_literal: true

module ApplicationHelper
  # content for the job posting status labels
  def status_label(posting)
    case posting.status
    when 'waiting_approval'
      content_tag(:div, 'pending approval', class: 'label label-warning')
    when 'draft'
      content_tag(:div, 'draft', class: 'label label-warning')
    when 'open'
      content_tag(:div, 'open', class: 'label label-success')
    when 'interviewing'
      content_tag(:div, 'interviewing', class: 'label label-info')
    else
      content_tag(:div, 'closed', class: 'label label-danger')
    end
  end

  # content for the organization status labels
  def status_label_organization(organization)
    case organization.status
    when 'waiting_approval'
      content_tag(:div, 'pending approval', class: 'label label-warning')
    when 'active'
      content_tag(:div, 'active', class: 'label label-success')
    else
      content_tag(:div, 'archived', class: 'label label-danger')
    end
  end

  # content for the job application status labels
  def status_label_application(application)
    case application.status
    when 'draft'
      content_tag(:div, 'draft', class: 'label label-warning')
    when 'submitted'
      content_tag(:div, 'submitted', class: 'label label-primary')
    when 'interview_scheduled'
      content_tag(:div, 'interview scheduled', class: 'label label-info')
    when 'hired'
      content_tag(:div, 'hired', class: 'label label-success')
    else
      content_tag(:div, 'not chosen', class: 'label label-danger')
    end
  end

  # content for the job application status labels
  def role_label_organization(organization)
    if organization.jobs.any? { |job| job.users.ids == current_user.id && job.role == 'management' }
      content_tag(:div, 'manager', class: 'label label-info')
    elsif organization.jobs.any? { |job| job.users.ids == current_user.id && job.role == 'admin' }
      content_tag(:div, 'admin', class: 'label label-primary')
    elsif organization.jobs.any? { |job| job.users.ids == current_user.id && job.role == 'regular' }
      content_tag(:div, 'member', class: 'label label-warning')
    end
  end
end
