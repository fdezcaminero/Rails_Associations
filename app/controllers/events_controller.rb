class EventsController < ApplicationController
    before_action :set_event, only: [:show]
    def index
        @events = Event.all
    end

    def create
        @event = current_user.events.build(event_params)

        respond_to do |format|
            if @event.save
                format.html { redirect_to action: 'index', notice: 'Event was successfully created.' }
                format.json { render :show, status: :created, location: @event }
            else
                format.html { render :new }
                format.json { render json: @event.errors, status: :unprocessable_entity }
            end
        end 
    end

    def new
        @event = current_user.events.build
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_event
        @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
        params.require(:event).permit(:name, :location, :day, :user_id)
    end 
end
