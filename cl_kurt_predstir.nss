/*
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 17. �rovni
Popis: Je v�eobecn� zn�mo, �e skute�n� dobr� Kurtiz�na to um� p�edst�rat. A kdy� je opravdu zku�en�, tak to stoj� za to...
Poskytuje: Kurtiz�na m��e pou��t speci�ln� �tok na bl�zko, je to hod proti TO rovnaj�c�mu se obrann�mu ��slu c�le. Ov�em BAB je nahrazeno z�kladn�m bonusem do P�esv�d�ov�n�. Pokud usp�je, c�l je zran�n za �ty�n�sobek zran�n� ze schopnosti Odhalen� �iv�tek.
Pou�it�: Jednou denn�
C�l: Humanoidn� bytost libovoln�ho pohlav�
*/
#include "sh_classes_inc_e"
#include "x0_i0_spells"
#include "ku_libtimenss"
void main()
{
    int iCasterLevel = GetLevelByClass(CLASS_TYPE_KURTIZANA);
    int iCha = GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA);
    object oTarget = GetSpellTargetObject();

    //object oSoul = GetSoulStone(OBJECT_SELF);
    object oTargetSoul  = GetSoulStone(oTarget);
    int iCount = GetLocalInt(oTargetSoul,"KURTIZANA_KZEMI");
    int iRacial = GetRacialType(oTarget);
    int iLaw = GetAlignmentLawChaos(oTarget) == ALIGNMENT_LAWFUL;
    int iDamage = 0;
    if (iLaw)
    {
        iDamage = d4((iCasterLevel+1)/2+1);
    }
    else
    {
        iDamage = d6((iCasterLevel+1)/2+1);
    }
    iDamage *=4;
    effect eDamage = EffectDamage(iDamage,DAMAGE_TYPE_BLUDGEONING);
    int iAC = GetAC(oTarget);
    int iPersuade = GetSkillRank(SKILL_PERSUADE,oTarget);
    if (
    iRacial == RACIAL_TYPE_DWARF ||
    iRacial == RACIAL_TYPE_ELF ||
    iRacial == RACIAL_TYPE_GNOME ||
    iRacial == RACIAL_TYPE_HALFELF ||
    iRacial == RACIAL_TYPE_HALFLING ||
    iRacial == RACIAL_TYPE_HALFORC ||
    iRacial == RACIAL_TYPE_HUMAN ||
    iRacial == RACIAL_TYPE_HUMANOID_GOBLINOID ||
    iRacial == RACIAL_TYPE_HUMANOID_MONSTROUS ||
    iRacial == RACIAL_TYPE_HUMANOID_ORC ||
    iRacial == RACIAL_TYPE_HUMANOID_REPTILIAN
    )
    {
            if (iPersuade >= iAC)
            {
                AssignCommand(OBJECT_SELF,ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oTarget));
            }
    }

}
