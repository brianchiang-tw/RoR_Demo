class EventsController < ApplicationController

    def index
        # Get all data from table Event
        @events = Event.all
    end


    # add a new item in table
    def new
        @event = Event.new
    end



    # create a new entry in table, data comes from new action
    def create
        @event = Event.new( event_params )
        @event.save

        # Redirect to action index after entry creation
        redirect_to :action => :index

    end




    private

    # Variable check (String parameters mechanism)
    def event_params
        params.require(:event).permit(:name, :description)
    end

 
end
