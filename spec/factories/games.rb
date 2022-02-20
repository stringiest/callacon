# frozen_string_literal: true

FactoryBot.define do
  factory :orient_horror, class: Game do
    association :user, factory: :john_smith

    title { 'Horror on the Orient Express' }
    game_system { 'Call of Cthulu' }
    description { 'Adventure across Europe on the Orient Express' }
    min_players { 2 }
    max_players { 4 }
    campaign { 'No' }
    game_duration_hours { 4 } # change from decimal to integer?
  end
end
