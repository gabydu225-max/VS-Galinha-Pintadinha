--[[
    just a kade engine 1.6 hud that i made cause why not
    if you have any custom difficulty better you go into line 48 to put it in work
    nps counter by @Rocco Productions#7428
]]--
function onCreatePost()
    setTimeBarColors('00FF00', '808080');
    setProperty('timeBarBG.scale.x', 1.61);
    setProperty('timeBar.scale.x', 1.62);
    setProperty('timeTxt.visible', false);

    makeLuaText('songPosTxt', songName, 0, 0, getProperty('timeBarBG.y'));
    screenCenter('songPosTxt', 'x');
    setTextSize('songPosTxt', 16);
    setProperty('songPosTxt.borderSize', 1);
    addLuaText('songPosTxt');

    makeLuaText('kadeEngineWatermark', songName..' - '..difficultyFromInt(difficulty)..' | PE '..version, 0, 4, getProperty('healthBarBG.y') + 50);
    setTextAlignment('kadeEngineWatermark', 'right');
    setProperty('kadeEngineWatermark.size', 16);
    setProperty('kadeEngineWatermark.borderSize', 1);
    addLuaText('kadeEngineWatermark');

    setHealthBarColors('FF0000', '66FF33');

    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true);
    end
end
function onUpdatePost()
    setProperty('iconP1.origin.x', 0);
    setProperty('iconP1.origin.y', 0);
    setProperty('iconP2.origin.x', 100);
    setProperty('iconP2.origin.y', 0);
    setProperty('iconP1.scale.x', lerp(getProperty('iconP1.scale.x'), 1, 0.50));
    setProperty('iconP2.scale.x', lerp(getProperty('iconP2.scale.x'), 1, 0.50));
    setProperty('songPosTxt.alpha', getProperty('timeBar.alpha'));
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
    runHaxeCode([[
        game.opponentStrums.members[]]..noteData..[[].playAnim('static', true);
    ]]);
end
function onEvent(name, value1, value2)
    if name == 'Change Character' then
        setHealthBarColors('FF0000', '66FF33');
    end
end
local difficultyArray = {'Easy', 'Normal', 'Hard'};
function difficultyFromInt(difficulty)
    return difficultyArray[difficulty+1] --adding 1 because lua starts on 1 not 0
end
function lerp(a,b,t) return a * (1-t) + b * t end --https://love2d.org/forums/viewtopic.php?t=83180