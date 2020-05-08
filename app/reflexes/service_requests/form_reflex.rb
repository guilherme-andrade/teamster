# frozen_string_literal: true

class ServiceRequests::FormReflex < ApplicationReflex
  def init_recipient
    @show_recipient = true
  end

  def add_parcel(attributes)
    parcel = ParcelForm.new(attributes)
    session[:parcels] << parcel if parcel.valid?
  end

  def remove_parcel
    parcel_index = element['data-target'].to_i
    session[:parcels].delete_at(parcel_index)
  end
end
