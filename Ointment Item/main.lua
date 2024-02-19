local mod = RegisterMod("Ointment Item", 1)
local OINTMENT_ID = Isaac.GetItemIdByName("Ointment")

function mod:EvaluateCache(player, cacheFlags)

    local itemCount = player:GetCollectibleNum(OINTMENT_ID)

    if cacheFlags & CacheFlag.CACHE_FIREDELAY == CacheFlag.CACHE_FIREDELAY then
        if player:HasCollectible(OINTMENT_ID) then
            player.MaxFireDelay = player.MaxFireDelay + 3 * itemCount
        end
    end

    if cacheFlags & CacheFlag.CACHE_LUCK == CacheFlag.CACHE_LUCK then
        if player:HasCollectible(OINTMENT_ID) then
            player.Luck = player.Luck + 1 * itemCount
        end
    end
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateCache)
