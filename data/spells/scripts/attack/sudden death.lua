local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)

function getCombatFormulas(cid, lv, maglv)
    local formula_min = -((lv * 2) + (maglv * 4) + 60)
    local formula_max = -((lv * 2) + (maglv * 7) + 60)

    -- Obtém a vocação do jogador
    local vocation = getPlayerVocation(cid)

    -- Aumenta 10% o dano se for Sorcerer (1) ou Master Sorcerer (5)
    if vocation == 1 or vocation == 5 then
        formula_min = math.floor(formula_min * 1.1)
        formula_max = math.floor(formula_max * 1.1)
    end

    -- Garante que o mínimo não seja maior que o máximo
    if formula_max < formula_min then
        local tmp = formula_max
        formula_max = formula_min
        formula_min = tmp
    end

    return formula_min, formula_max
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getCombatFormulas")

function onCastSpell(cid, var)
    return doCombat(cid, combat, var)
end
