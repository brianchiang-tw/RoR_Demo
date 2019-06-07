class Event < ApplicationRecord
    # Declare that attribute "name" is a must
    validates_presence_of :name
end
