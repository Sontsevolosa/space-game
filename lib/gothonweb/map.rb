module Map

    class Room

        def initialize(name, description, tooltip)
            @name = name
            @description = description
            @paths = {}
            @tooltip = tooltip
        end
        
            
        # these make it easy for you to access the variables
        attr_reader :name
        attr_reader :paths
        attr_reader :description
        attr_reader :tooltip
    
        def go(direction)
            return @paths[direction]
        end
    
        def add_paths(paths)
            @paths.update(paths)
        end
    
    end

    # The first variant of game map
    
    CENTRAL_CORRIDOR = Room.new("Central Corridor",
    """
    The Gothons of Planet Percal #25 have invaded your ship and destroyed
    your entire crew. You are the last surviving member and your last
    mission is to get the neutron destruct bomb from the Weapons Armory,
    put it in the bridge, and blow the ship up after getting into an escape
    pod.
    
    You're running down the central corridor to the Weapon Armory when a
    Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown
    costume flowing arount his hate filled body. He's blocking the door to
    the Armory and about to pull a weapon to blast you.
    """,
    "You have only 3 variants: \'tell a joke\', \'dodge!\' and \'shoot!\'. The most incredible variant will save your life!")
    
    
    LASER_WEAPON_ARMORY = Room.new("Laser Weapon Armory",
    """
    Lucky for you they made you learn Gothon insults in the academy. 
    You tell the one Gothon joke you know:
    Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq
    gur ubhfr.
    The Gothon stops, tries not to laugh, then busts out laughting and
    can't move. While he's laughting you run up and shoot him square in the
    head putting him dowm, then jump through the Weapon Armory door.
    
    You do a dive roll into the Weapon Armory, crouch and scan the room for
    more Gothons that might be hiding. It's dead qiet, too qiet. You stand
    up and run to the far side of the room and find the neutron bomb 
    in its container. There's a keypad lock on the box and you need
    the code to get the bomb out. If you get the code wrong 
    10 times then the lock closes forever and you can't get 
    the bomb. The code is 4 digits. 
    """,
    "The correct answer is a sequence of four natural numbers starting from zero where the third and the fourth numbers changed places.")
    
    
    THE_BRIDGE = Room.new("The Bridge",
    """
    The container clicks open and the seal breaks, letting gas out. You
    grab the neutron bomb and run as fast as you can to the bridge where
    you must place it in the right spot.
    
    You burst onto the Bridge with neutron destruct bomb under your arm and
    surprise 5 Gothons who are trying to take control of the ship. Each of
    them has an even uglier clown costume than the last. They haven't
    pulled their weapons out yet, as they see the active bomb under your
    arm and don't want to set it off.
    """,
    "You must slowly place the bomb, without jerks!")
    
    
    ESCAPE_POD = Room.new("Escape Pod",
    """
    You point your blaster at the bomb under your arm and the Gothons put
    their hands up and start to sweat. You inch backward to the door, open
    it, and then carefully place the bomb on the floor, pointing your
    blaster at it. You then jump back through the door, punch the clode
    button and blast the lock so the Gothons can't get out.
    Now that the bomb is placed you run to the escape pod to get off this
    tin can.
    
    You rush through the ship desperately trying to make it to the escape
    pod before the whole ship explodes. It seems like hardly any
    Gothons are on the ship, so your run is clear of interference.
    You get to the chamber with the escape pods, and now need
    to pick one to take. Some of them could be damaged but you
    don't have time to look. There's 5 pods, which one
    do you take?
    """,
    "Take the one which is the second!")
    
    
    THE_END_WINNER = Room.new("The End",
    """
    You jump into pod 2 and hit the eject button.
    The pod easily slides out into space heading to the planet below. As it
    flies to the planet, you look back and see your ship implode then
    explode like a bright star, taking out the Gothon ship at the same
    time. You won!
    """,
    "Congratulations! ^_^")
    
    
    THE_END_LOSER = Room.new("The End",
    """
    You jump into a random pod and hit the eject button.
    The pod escapes out into the void of space, then implodes as the hull
    ruptures, crushing your body into jam jelly.
    """,
    "Looser! -_-")
    
   
    
    
    ESCAPE_POD.add_paths({
        '2' => THE_END_WINNER,
        '*' => THE_END_LOSER
    })
    
    GENERIC_DEATH = Room.new("death", "You died.", "Sorry...")
    
    THE_BRIDGE.add_paths({
        'throw the bomb' => GENERIC_DEATH,
        'slowly place the bomb' => ESCAPE_POD
    })
    
    LASER_WEAPON_ARMORY.add_paths({
        '0132' => THE_BRIDGE,
        '*' => GENERIC_DEATH
    })
    
    CENTRAL_CORRIDOR.add_paths({
        'shoot!' => GENERIC_DEATH,
        'dodge!' => GENERIC_DEATH,
        '*' => GENERIC_DEATH,
        'tell a joke' => LASER_WEAPON_ARMORY
    })
    
    START = CENTRAL_CORRIDOR
    
    
    
    # The second variant of game map
    
    PILOT_ROOM = Room.new("Pilot Room",
    """
    The Red Planet was attacked by Army of Metal Cardinals. Planet's inhabitants
    sent their the most daring envoys to the Yellow Water Planet to ask for help
    in the fight with Army of Metal Cardinals.
    
    You are one of this envoys. Your assignment - control the spaceship.
    You have assistant - his name is Valeo. He can to repair spaceship. Now you are
    in the pilot room. Your spaceship fly between other planets. 
    Suddenly security guards which guarded Single Rose Planet perceived you 
    as criminal. They started firing. Some of them penetrated in your 
    spaceship. What will you do?
    """,
    "Yes, you can run to the another room and hide there. But attackers blocked the entrance to the rooms. You also can shoot - but until you will get weapon attacker will shoot the first. Maybe you must sing song?")
    
    
    DEVICES_ROOM = Room.new("Devices Room",
    """
    Bravo! Attackers are shocked! You have a bit of time to run, take your weapon and
    shoot at attackers. They died. Now you can go to the Devices Room in order to repair
    your spaceship which was damaged by attackers.
    
    You came to the Devices Room. Attackers managed to destroy the spaceship considerably.
    You must to fix it! But in order to repair your spaceship you must unlock the dashboard.
    Enter the code. It has 2 digits. The first digit is from 1 to 3; the second digit
    is from 1 to 3 too.
    """,
    "Your PIN code is number that is half of 46.")
    
    
    BATTLE = Room.new("Battle",
    """
    Greetings! Dashboard is unlocked. Take Valeo and repair your spaceship. 
    Do it very quickly - until attackers didn't destroy it! And run to protect spaceship!
    
    In order to arrive to Yellow Water Planet safely you must neutralize all attackers.
    What do you want to use for it?
    """,
    "You have a knife and a bomb. One of it can kill you and another can kill attackers.")
    
    
    CATAPULTING = Room.new("Catapulting",
    """
    You are very clever! This weapon is very effective! But before the spaceship blows up
    you must to catapult - in order to save your life.
    
    You run very quickly to room with special capsules for catapulting. In the room
    you see 2 capsules. Which will you take?
    """,
    "Apply your intuition and make a choice!")
    
    
    FINISHED = Room.new("The End",
    """
    You were born under a lucky star! You have flew successfully to the Yellow Water Planet
    and told local residents about attack by Army of Metal Cardinals. Residents sent aid
    to your planet. And join efforts made it possible defeat Army of Metal Cardinals.
    """,
    "Hurray! :)")
    
    
    DYING = Room.new("R.I.P.", 
    """
    This choice is wrong. You could not to save your life! You died.
    """,
    "It's very sad ;(")
    
    
    PILOT_ROOM.add_paths({
        'run' => DYING,
        'shoot' => DYING,
        'sing song' => DEVICES_ROOM
    })
    
    DEVICES_ROOM.add_paths({
        '23' => BATTLE,
        '*' => DYING
    })
    
    BATTLE.add_paths({
        'knife' => DYING,
        'bomb' => CATAPULTING
    })
    
    CATAPULTING.add_paths({
        '1' => DYING,
        '2' => FINISHED
    })
    
    BEGINNING = PILOT_ROOM
    
    # A whitelist of allowed room names. We use this so that
    # bad people on the internet can't access random variables
    # with names. You can use Test::constants and Kernel.const_get
    # too.
    ROOM_NAMES = {
        'CENTRAL_CORRIDOR' => CENTRAL_CORRIDOR,
        'LASER_WEAPON_ARMORY' => LASER_WEAPON_ARMORY,
        'THE_BRIDGE' => THE_BRIDGE,
        'ESCAPE_POD' => ESCAPE_POD,
        'THE_END_WINNER' => THE_END_WINNER,
        'THE_END_LOSER' => THE_END_LOSER,
        'START' => START,
        'BEGINNING' => BEGINNING,
        'PILOT_ROOM' => PILOT_ROOM,
        'DEVICES_ROOM' => DEVICES_ROOM,
        'BATTLE' => BATTLE,
        'CATAPULTING' => CATAPULTING,
        'FINISHED' => FINISHED,
        'DYING' => DYING
    }
    
    
    
    def Map::load_room(session)
        # Given a session this will return the right room or nil
        return ROOM_NAMES[session[:room]]
    end
    
    def Map::save_room(session, room)
        # Store the room in the session for later, using its name
        session[:room] = ROOM_NAMES.key(room)
    end
    
end
