class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.new(params[:event])

    if @event.valid?
      callback = current_user.facebook.put_object('me', 'events', @event.to_facebook_params)

      @event.fb_id = callback["id"]
      @event.save

      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])

    if @event.acceptable_invites.any?
      render 'details' # table of friends
    else
      render 'show' # event status
    end
  end

  def update
    @event = Event.find(params[:id])

    @event.attributes = params[:event]
    
    if @event.save
      render :json => @event.acceptable_invites
    else
      redirect_to @event
    end
  end

  def destroy
    @event = Event.find params[:id]
    if @event.destroy
      redirect_to events_path
    else
      render(:text => 'Sorry, your event was not successfully deleted. Please try again.')
    end
  end

end
