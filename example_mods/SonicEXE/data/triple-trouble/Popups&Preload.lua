function onCreate()
    preloadImage('Phase3/Phase3Static')

    print('triple-trouble/script.lua: Precached shit!!!!!')
end

stepHitFuncs = { --a bunch of timed events, timed to steps (all code typed by junior - https://www.youtube.com/channel/UCJGR8x_g-cE1KsXKR_jZXAg)
    [1] = function()
    makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y

    setScrollFactor('static', 0, 0);
    addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
    objectPlayAnimation('static', 'stat', false);

    scaleObject('static', 5, 5);
  
    if Popups then
        addLuaSprite('static', true);

        print('triple-trouble/script.lua: Static change thing')
    end

    noteTweenX('NoteMove1', 0, 100, 0.1, cubeInOut)
    noteTweenX('NoteMove2', 1, 200, 0.1, cubeInOut)
    noteTweenX('NoteMove3', 2, -768, 0.1, cubeInOut)
    noteTweenX('NoteMove4', 3, 300, 0.1, cubeInOut)
    noteTweenX('NoteMove5', 4, 400, 0.1, cubeInOut)

    setObjectCamera('static', 'camHUD')

    end,

    [16] = function()
    removeLuaSprite('static', true);  
    end,

    [144] = function()
    makeLuaSprite('TailsJump', 'Jumpscare/Tails', 50, 0)
    setScrollFactor('TailsJump', 0.9, 0.9)
    scaleObject('TailsJump', 1.0, 1.0);
    end,

    [152] = function()
    removeLuaSprite('TailsJump', true);  
    end,

    [1032] = function()
    makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
  
    setScrollFactor('static', 0, 0);
    addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
    objectPlayAnimation('static', 'stat', false);
  
    scaleObject('static', 5, 5);
    
    if Popups then
        addLuaSprite('static', true);
  
        print('triple-trouble/script.lua: Static change thing')
    end

    setObjectCamera('static', 'camHUD')
  
    end,

    [1042] = function()
        removeLuaSprite('static', true);  
    end,
  
    [1219] = function()
        makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
      
        setScrollFactor('static', 0, 0);
        addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
        objectPlayAnimation('static', 'stat', false);
      
        scaleObject('static', 5, 5);
        
        if Popups then
            addLuaSprite('static', true);
      
            print('triple-trouble/script.lua: Static change thing')
        end
    
        setObjectCamera('static', 'camHUD')
      
    end,

    [1229] = function()
        removeLuaSprite('static', true);  
    end,

    [1287] = function()
        makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
      
        setScrollFactor('static', 0, 0);
        addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
        objectPlayAnimation('static', 'stat', false);
      
        scaleObject('static', 5, 5);
        
        if Popups then
            addLuaSprite('static', true);
      
            print('triple-trouble/script.lua: Static change thing')
        end
        
        noteTweenX('NoteMove1', 0, 700, 0.1, cubeInOut)
        noteTweenX('NoteMove2', 1, 800, 0.1, cubeInOut)
        noteTweenX('NoteMove3', 2, -910, 0.1, cubeInOut) --hello if u are reading, this is the middle note for the opponent so uh pretty useless
        noteTweenX('NoteMove4', 3, 900, 0.1, cubeInOut)
        noteTweenX('NoteMove5', 4, 1000, 0.1, cubeInOut)
        noteTweenX('NoteMove6', 5, 68, 0.1, cubeInOut)
        noteTweenX('NoteMove7', 6, 168, 0.1, cubeInOut)
        noteTweenX('NoteMove8', 7, 268, 0.1, cubeInOut)
        noteTweenX('NoteMove9', 8, 368, 0.1, cubeInOut)
        noteTweenX('NoteMove10', 9, 468, 0.1, cubeInOut)
    
        setObjectCamera('static', 'camHUD')
      
    end,

    [1295] = function()
        removeLuaSprite('static', true);  
    end,

    [1296] = function()
        makeLuaSprite('KnucklesJump', 'Jumpscare/Knuckles', 50, 0)
        setScrollFactor('KnucklesJump', 0.9, 0.9)
        scaleObject('KnucklesJump', 1.0, 1.0);
    end,
    
    [1304] = function()
        removeLuaSprite('KnucklesJump', true);  
    end,

    [2307] = function()
        makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
      
        setScrollFactor('static', 0, 0);
        addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
        objectPlayAnimation('static', 'stat', false);
      
        scaleObject('static', 5, 5);
        
        if Popups then
            addLuaSprite('static', true);
      
            print('triple-trouble/script.lua: Static change thing')
        end
    
        setObjectCamera('static', 'camHUD')
      
    end,

    [2320] = function()
        removeLuaSprite('static', true);  
    end,

    [2820] = function()
        makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
      
        setScrollFactor('static', 0, 0);
        addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
        objectPlayAnimation('static', 'stat', false);
      
        scaleObject('static', 5, 5);
        
        if Popups then
            addLuaSprite('static', true);
      
            print('triple-trouble/script.lua: Static change thing')
        end
        
        noteTweenX('NoteMove1', 0, 100, 0.1, cubeInOut)
        noteTweenX('NoteMove2', 1, 200, 0.1, cubeInOut)
        noteTweenX('NoteMove3', 2, -841, 0.1, cubeInOut) --hello if u are reading, this is the middle note for the opponent so uh pretty useless
        noteTweenX('NoteMove4', 3, 300, 0.1, cubeInOut)
        noteTweenX('NoteMove5', 4, 400, 0.1, cubeInOut)
        noteTweenX('NoteMove6', 5, 710, 0.1, cubeInOut)
        noteTweenX('NoteMove7', 6, 810, 0.1, cubeInOut)
        noteTweenX('NoteMove8', 7, 910, 0.1, cubeInOut)
        noteTweenX('NoteMove9', 8, 1010, 0.1, cubeInOut)
        noteTweenX('NoteMove10', 9, 1110, 0.1, cubeInOut)
    
        setObjectCamera('static', 'camHUD')
      
    end,

    [2823] = function()
        makeLuaSprite('EggmanJump', 'Jumpscare/Eggman', 50, 0)
        setScrollFactor('EggmanJump', 0.9, 0.9)
        scaleObject('EggmanJump', 1.0, 1.0);
    end,
    
    [2830] = function()
        removeLuaSprite('EggmanJump', true);  
    end,

    [2832] = function()
        removeLuaSprite('static', true);  
    end,

    [4100] = function()
        makeAnimatedLuaSprite('static', 'Phase3/Phase3Static', -50, -40); --x and y
      
        setScrollFactor('static', 0, 0);
        addAnimationByPrefix('static', 'stat', 'Phase3Static instance 1', 24, false);
        objectPlayAnimation('static', 'stat', false);
      
        scaleObject('static', 5, 5);
        
        if Popups then
            addLuaSprite('static', true);
      
            print('triple-trouble/script.lua: Static change thing')
        end
    
        setObjectCamera('static', 'camHUD')
      
    end,

    [4111] = function()
        removeLuaSprite('static', true);  
    end,
}