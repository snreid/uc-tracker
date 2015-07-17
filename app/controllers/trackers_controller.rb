class TrackersController < ApplicationController
  before_action :set_tracker, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @trackable = find_trackable
    @trackers = @trackable.trackers
    respond_with(@trackers)
  end

  def show
    respond_with(@tracker)
  end

  def new
    @tracker = Tracker.new
    respond_with(@tracker)
  end

  def edit
  end

  def create
    @trackable = find_trackable
    @tracker = @trackable.trackers.build(tracker_params)
    @tracker.save
    respond_with(@tracker)
  end

  def update
    @tracker.update(tracker_params)
    respond_with(@tracker)
  end

  def destroy
    @tracker.destroy
    respond_with(@tracker)
  end

  private
    def set_tracker
      @tracker = Tracker.find(params[:id])
    end

    def tracker_params
      params.require(:tracker).permit()
    end

    def find_trackable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
      nil
    end
end
