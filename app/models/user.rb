class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rosters
  has_many :team_rosters, through: :rosters 
  has_many :roster_invitations, :class_name => "RosterInvite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "RosterInvite", :foreign_key => 'sender_id'
  has_many :team_admins, :class_name => "Teams", :foreign_key => 'team_admin_id'
  has_many :events, :class_name => "Events", :foreign_key => 'created_by_user_id'
  has_many :user_payments
  has_many :payments, through: :user_payments

  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def is_captain?(team)
		team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
		roster = Roster.where("team_roster_id = ? AND user_id = ?", team_roster.id, self.id).first
		if !roster.nil?
			roster.captain?
		end
	end

  def created_event?(event)
    current_user.id == event.created_by_user_id
  end

  def is_on_team?(team)
    team_roster = TeamRoster.where("team_id = ? AND current = ?", team.id, true).first
    roster = Roster.where("team_roster_id = ? and user_id = ?", team_roster.id, self.id).first
    if roster.nil?
      false
    end
    true
  end
end
