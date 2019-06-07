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



    # query specific item by entry id
    def show

        @event = Event.find( params[:id] )
        @page_title = @event.name

    end


    # edit specific item by entry id
    def edit

        @event = Event.find( params[:id] )

    end

    # update the result of edit
    def update
        @event = Event.find( params[:id] )
        @event.update( event_params )

        # Redirect to action show after update completion
        redirect_to :action => :show, :id => @event
    end



    # delete specific item by entry id
    def destroy

        @event = Event.find( params[:id] )
        @event.destroy

        # Redirect to action index after delete completion
        redirect_to :action => :index

    end



    # Method attribute after this line is set to "private".
    private

    # Variable check (String parameters mechanism)
    def event_params
        params.require(:event).permit(:name, :description)
    end

 
end
