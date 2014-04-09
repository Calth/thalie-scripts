/*
Rozptyluj�c� dekolt
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 1. �rovni
Popis: D�vka ulice se nestyd� vyu��t sv�j p�vab i v boji a nep��tele dok�e hlubok�m dekoltem tak rozpt�lit, �e mnohdy ignoruje d�n� kolem sebe.
Poskytuje: Pokud v �irok�m okol� bytosti neusp�j� v z�chrann�m hodu na V�li proti TO (celkov� hodnota Charismatu), tak se jim sn�� dovednosti V��mavost a hled�n� a hody na Iniciativu. Pokud ob�ti odolaj� Kurtiz�nin� �armu, z�sk�vaj� proti jej�mu dekoltu na 24 hodin imunitu. Naopak, pokud neodolaj�, m��e je Kurtiz�na rozpt�lit sv�m dekoltem opakovan� - v takov�m p��pad� se zp�soben� postihy s��taj�. Pokud n�jak� z ob�t� m� ji� v�echny sni�ovan� hodnoty na nule a op�t neusp�je v hodu, tak je om�mena na 1 kolo.
Pou�it�: V�b�rem. Odbornost lze pou��t jednou za kolo.
Trv�n�: P�i �sp�chu trvaj� postihy zp�soben� nep��teli po po�et kol rovnaj�c� se �rovni Kurtiz�ny.
C�l: Pouze humanoidn� bytosti. Zv��ata a nemrtv� stvo�en� jsou v��i t�lesn�m p�vab�m Kurtiz�ny lhostejn�.
*/
#include "sh_classes_inc_e"
#include "x0_i0_spells"
#include "cl_kurt_plav_inc"
void main()
{

    int iCasterLevel = GetLevelByClass(CLASS_TYPE_KURTIZANA);
    int iCha = GetAbilityScore(OBJECT_SELF,ABILITY_CHARISMA);
    //object oTarget = GetSpellTargetObject();
    object oSoul = GetSoulStone(OBJECT_SELF);
    //object oTargetSoul  = GetSoulStone(oTarget);
    int iSpot,iSearch,iGender,iRacial;
    effect eDaze = EffectDazed();
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eMind = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
    effect eLink = EffectLinkEffects(eMind, eDaze);
    eLink = EffectLinkEffects(eLink, eDur);
    effect eVis = EffectVisualEffect(VFX_IMP_DAZED_S);
    effect eSpotDec = EffectSkillDecrease(SKILL_SPOT,3);
    effect eSearchDec = EffectSkillDecrease(SKILL_SEARCH,3);
    int iHairColorType =  GetLocalInt(oSoul,"KURTIZANA_BARVA_TYP");
    int iDCBonus = (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE)-10)*(iHairColorType == PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKY);
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if (oTarget == OBJECT_SELF)
        {
            oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
            continue;
        } 
        iSpot = GetSkillRank(SKILL_SPOT,oTarget);
        iSearch = GetSkillRank(SKILL_SEARCH,oTarget);
        iGender = GetGender(oTarget);
        iRacial = GetRacialType(oTarget);
        if (iGender == GENDER_MALE && (
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
        ))
        {
            //pokud neuspeje v hodu
            if (MySavingThrow(SAVING_THROW_WILL,oTarget,iCha+iDCBonus,SAVING_THROW_TYPE_ALL) == 0)
            {
                if (iSpot == 0 || iSearch == 0)
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1));
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                }
                else
                {
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDur, oTarget, RoundsToSeconds(iCasterLevel));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSpotDec, oTarget, RoundsToSeconds(iCasterLevel));
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSearchDec, oTarget, RoundsToSeconds(iCasterLevel));

                }

            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_MEDIUM, GetSpellTargetLocation(), TRUE);
    }
}

