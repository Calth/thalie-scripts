//::///////////////////////////////////////////////
//:: Stonehold
//:: X2_S0_StneholdC
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates an area of effect that will cover the
    creature with a stone shell holding them in
    place.
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: May 04, 2002
//:://////////////////////////////////////////////

#include "NW_I0_SPELLS"
#include "x0_i0_spells"
#include "x2_inc_spellhook"
#include "ku_boss_inc"

void main()
{

    //Declare major variables
    int nRounds;
    int nMetaMagic = GetMetaMagicFeat();
    effect eHold = EffectParalyze();
    effect eDur = EffectVisualEffect(476 );
    eHold = EffectLinkEffects(eDur, eHold);
    effect eSlow = EffectLinkEffects(eDur, EffectSlow());
    effect eFind;
    object oTarget;
    object oCreator;
    float fDelay;
    int iSpecBonus = 0;
    if (GetHasFeat(FEAT_DRUID_SPECIALIZACE_PRIRODA) || GetHasFeat(FEAT_DRUID_SPECIALIZACE_MOROVY))
    {
        iSpecBonus= 2;
    }
    //--------------------------------------------------------------------------
    // GZ 2003-Oct-15
    // When the caster is no longer there, all functions calling
    // GetAreaOfEffectCreator will fail.
    //--------------------------------------------------------------------------
    if (!GetIsObjectValid(GetAreaOfEffectCreator()))
    {
        DestroyObject(OBJECT_SELF);
        return;
    }

    oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        if(spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, GetAreaOfEffectCreator()))
        {
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_STONEHOLD));
            if (!GetHasSpellEffect(SPELL_STONEHOLD,oTarget))
            {
                if(!MyResistSpell(GetAreaOfEffectCreator(), oTarget))
                {
                    if(!MySavingThrow(SAVING_THROW_WILL, oTarget, GetSpellSaveDC()+GetThalieSpellDCBonus(OBJECT_SELF)+iSpecBonus, SAVING_THROW_TYPE_MIND_SPELLS))
                    {
                       nRounds = MaximizeOrEmpower(6, 1, nMetaMagic);
                       fDelay = GetRandomDelay(0.75, 1.75);
                       // Boss exception 
                       if(GetIsBoss(oTarget))
                         DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSlow, oTarget, RoundsToSeconds(nRounds)));
                       else
                         DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eHold, oTarget, RoundsToSeconds(nRounds)));
                    }
                }
            }
        }
        oTarget = GetNextInPersistentObject();
    }
}
