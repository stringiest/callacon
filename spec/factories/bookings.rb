# frozen_string_literal: true

FactoryBot.define do
  factory :march_22, class: Booking do
    association :user, factory: :john_smith

    arrival { '2022-03-21' }
    departure { '2022-03-28' }
    donation { 10 }
    assistance { false }
    sps { false }
    family { false }
  end
end
