# frozen_string_literal: true

class Reviewer < ApplicationRecord
<<<<<<< HEAD
=======
  validates :reviewer_email, :tamu_department_id, presence: true
>>>>>>> lance-rspec
  belongs_to :tamu_department
end
