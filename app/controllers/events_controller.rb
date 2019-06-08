class EventsController < ApplicationController

    before_action :set_event, :only => [ :show, :edit, :update, :destroy ]


    def index
        # Get all data from table Event
        #@events = Event.all

        # Get all data from table Event, and make each 5 pages as a group
        @events = Event.page(params[:page]).per(5)

    end


    # add a new item in table
    def new
        @event = Event.new
    end



    # create a new entry in table, data comes from new action
    def create
        @event = Event.new( event_params )
        save_successful = @event.save

        if save_successful

            # Redirect to action index after entry creation
            # redirect_to :action => :index

            # RESTful style
            redirect_to events_url

        else

            # Go back to new data input webpage for re-input again
            render :action => :new

        end

        # Use the Flash message in Rails
        flash[:notice] = "Event was successfully created."

    end



    # query specific item by entry id
    def show

        #@event = Event.find( params[:id] )
        @page_title = @event.name

    end


    # edit specific item by entry id
    def edit

        #@event = Event.find( params[:id] )

    end

    # update the result of edit
    def update
        #@event = Event.find( params[:id] )

        update_successful =@event.update( event_params )

        if update_successful

            # Redirect to action show after update completion
            # redirect_to :action => :show, :id => @event

            # RESTful style
            redirect_to event_url( @event )

        else

            # Go back to new data edit webpage for re-input again
            render :action => :edit

        end

        # Use the Flash message in Rails
        flash[:notice] = "event was successfully updated."

    end



    # delete specific item by entry id
    def destroy

        #@event = Event.find( params[:id] )
        @event.destroy

        # Redirect to action index after delete completion
        #redirect_to :action => :index

        # RESTful style
        redirect_to events_url

        # Use the Flash message in Rails
        flash[:alert] = "event was successfully deleted"

    end



    # Method attribute after this line is set to "private".
    private

    # Variable check (String parameters mechanism)
    def event_params
        params.require(:event).permit(:name, :description)
    end


    # Make a tempate for shared code block reuse in action
    def set_event
        @event = Event.find( params[:id] )
    end
 
end
