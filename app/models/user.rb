class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :rosters

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
end
