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
    civilized_date
    @trackable = find_trackable
    @tracker = @trackable.trackers.build(tracker_params)
    @tracker.save
    respond_with(@tracker)
  end

  def update
    civilized_date
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

    def civilized_date
      date = params[:tracked_date]
      tracker_params[:tracked_date] = DateTime.civil(date[:year].to_i, date[:month].to_i, date[:day].to_i, date[:hour].to_i, date[:minute].to_i)
    end

    def tracker_params
      params.require(:trackers).permit(:trackable_id, :trackable_type, :tracked_date, :user_id)
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
