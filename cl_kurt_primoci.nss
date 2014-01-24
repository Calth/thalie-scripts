/*
P�imhou�ete o�i
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 6. �rovni
Popis:
Poskytuje: Na 6. �rovni se dok�e Kurtiz�na zneviditelnit. Jakmile v�ak b�hem trv�n� tohoto zneviditeln�n� provede �to�nou akci, efekt se p�ed�asn� zru��.
Pou�it�: 3 za den.
Trv�n�: Po�et kol rovnaj�c� se celkov�mu Charismatu postavy
C�l: Pouze na sebe
*/
#include "sh_classes_inc_e"
void main()
{

    //effect eVis = EffectVisualEffect(VFX_DUR_INVISIBILITY);
    effect eInvis = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE);
    effect eLink = EffectLinkEffects(eInvis, eDur);
    //eLink = EffectLinkEffects(eLink, eVis);
    int iCha = GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA);
    //Fire cast spell at event for the specified target
    SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_INVISIBILITY, FALSE));
    int nDuration = GetLevelByClass(CLASS_TYPE_KURTIZANA);

    //Apply the VFX impact and effects
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, OBJECT_SELF, TurnsToSeconds(iCha));
}

