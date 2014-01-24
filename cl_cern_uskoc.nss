//::///////////////////////////////////////////////
//:: cl_cern_uskoc
//:://////////////////////////////////////////////
/*
  Cernokneznik - uskocnost
*/
//:://////////////////////////////////////////////
//:: Created By: Shaman88
//:: Created On:

//:://////////////////////////////////////////////
#include "sh_classes_inc"

void main()
{
    if (GetArcaneSpellFailure(OBJECT_SELF)> 20)
    {
        return;
    }
    //Declare major variables
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    int iModify = 4;
    effect eDex = EffectAbilityIncrease(ABILITY_DEXTERITY,iModify);
    effect eLink = EffectLinkEffects(eDex, eDur);
    effect eTumble = EffectSkillIncrease(SKILL_TUMBLE,iModify);
    eLink = EffectLinkEffects(eLink,eTumble);

    //Apply visual and bonus effects
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, HoursToSeconds(24));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
}

