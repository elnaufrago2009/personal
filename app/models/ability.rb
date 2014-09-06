class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # esto es para los nuevos usuarios no logeados
    if user.has_role? :superadmin
        can :manage, Deparment
        can :manage, CenterWork
        can :manage, Area
        can :manage, Turno
        can :manage, UserTurno
        can :manage, Admin
        can :manage, AssignRole
        can :manage, About
        can [:todos], [Registro]
        can [:option_entrada], [Registro]
        can [:option_salida], [Registro]
        can [:superadmin_message], [Registro]
        can [:add_superadmin_message], [Registro]
    end
    if user.has_role? :admin
        can :manage, Inicio
        can [:index], [Registro]
        can [:usuarios], [Registro]
        can [:option_entrada], [Registro]
        can [:option_salida], [Registro]
        can [:message], [Registro]
        can [:add_message], [Registro]
        can :manage, About
    end
           
    if user.has_role? :normal
        can :manage, Inicio  
        can :manage, About              
      #can :read, :all
      #can :index, Inicio
      #can :manage, About
    else 
        can [:home], [About]
        #can :manage, About
    end

    
    
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
