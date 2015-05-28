class CharacterAppearance < ActiveRecord::Base
  belongs_to :issue
  belongs_to :character
end
