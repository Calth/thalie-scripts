/*
Jak jsi mi to rekl?
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 3. �rovni
Popis: N�kdy si lidi z�sk�te pomoc� sladk�ho �sm�vu a ochoty. Jindy v�m nezbude nic jin�ho ne� jim nakopat �i�. Kurtiz�na m��e pou��t svou zu�ivost b�hem boje jako samostatnou akci.
Poskytuje: Postava z�sk� +2 do AB a 2k6 k fyzick�mu zran�n� a p�i aktivaci m��e vystra�it v�echny v okol� - hod na V�li proti cel� hodnota jej�ho Charismatu.
Pou�it�: V�b�rem. Bonus do zran�n� Kurtiz�na z�sk�v�, jen pokud m� v ruce d�ku.
Trv�n�: 1 tah
*/
#include "sh_classes_inc_e"
#include "x0_i0_spells"
#include "cl_kurt_plav_inc"

void main()
{
    if (GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND))!= BASE_ITEM_DAGGER) return;
    int iCasterLevel = GetLevelByClass(CLASS_TYPE_KURTIZANA);
    int iCHa = GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA);
    object oTarget = GetSpellTargetObject();
    object oSoul = GetSoulStone(OBJECT_SELF);
    int iHairColorType =  GetLocalInt(oSoul,"KURTIZANA_BARVA_TYP");

    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eAB = EffectAttackIncrease(2);
    effect eDMG = EffectDamageIncrease(DAMAGE_BONUS_2d6,DAMAGE_TYPE_DIVINE);
    effect eLink = EffectLinkEffects(eAB, eDMG);
    eLink = EffectLinkEffects(eLink, eDur);
    if (iHairColorType == PANOVE_RADEJI_PLAVOVLASKY_ZRZKY)
    {
        effect eBonusDamage = EffectDamageIncrease(DAMAGE_BONUS_2d12,DAMAGE_TYPE_FIRE);
        eLink = EffectLinkEffects(eLink, eBonusDamage);
        effect eBonusReduction = EffectDamageResistance(DAMAGE_TYPE_FIRE,10);
        eLink = EffectLinkEffects(eLink, eBonusReduction);
    }
    eLink = ExtraordinaryEffect(eLink);
    int iDCBonus = (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE)-10)*(iHairColorType == PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKY);

    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE); //Change to the Rage VFX
    //Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, RoundsToSeconds(10));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
    effect eFear = EffectFrightened();
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR);
    effect eImpact = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20);
    float fDelay;
    //Link the fear and mind effects
    effect eLink1 = EffectLinkEffects(eFear, eMind);
    //Apply Impact
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, GetSpellTargetLocation());
    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if (oTarget == OBJECT_SELF)
        {
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
            continue;
        }
        if (spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, OBJECT_SELF))
        {
            fDelay = GetRandomDelay();
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_FEAR));
            //Make SR Check
            if(!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
            {
                //Make a will save
                if(!MySavingThrow(SAVING_THROW_WILL, oTarget, iCHa+iDCBonus, SAVING_THROW_TYPE_FEAR, OBJECT_SELF, fDelay))
                {
                    //Apply the linked effects and the VFX impact
                    DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink1, oTarget, RoundsToSeconds(3)));
                }
            }
        }
        //Get next target in the spell cone
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
    }

}

