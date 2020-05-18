class InvitesController < ApplicationController
  def create
    @invite = current_user.invites.build(invite_params)
    if @invite.save
      flash.now[:notice] = 'Invitation Sent Successfully!'
      redirect_to current_user
    else
      flash.now[:error] = 'Error creating invitation'
    end
  end

  def new
    @invite = current_user.invites.build
  end

  private

  def invite_params
    params.require(:invite).permit(:attendee_id, :attended_event_id)
  end
end
