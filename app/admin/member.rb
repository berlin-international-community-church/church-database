# frozen_string_literal: true
ActiveAdmin.register Member do
  permit_params :first_name,
                :last_name,
                :gender,
                :birthday,
                :phone1,
                :phone2,
                :email,
                address_attributes: [:street, :street_number, :area_code, :city, :country, _destroy: true]

  form title: 'Creating / Updating' do |f|
    inputs 'Details' do
      input :first_name
      input :last_name
      input :gender, collection: %w(Male Female)
      input :birthday, start_year: Date.today.year - 90, end_year: Date.today.year
      input :phone1
      input :phone2
      inputs do
        has_many :address do |a|
          a.input :street
          a.input :street_number
          a.input :area_code
          a.input :city
          a.input :country, priority_countries: ['DE']
        end
      end
      li "Created at #{f.object.created_at}" unless f.object.new_record?
    end
    para 'Press cancel to return to the list without saving.'
    actions
  end
end
