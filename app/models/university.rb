# frozen_string_literal: true

class University < ApplicationRecord
  validates :city_country, :university_name, presence: true
  # has_many :foreign_course
end
