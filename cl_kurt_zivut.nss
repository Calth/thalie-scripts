//::///////////////////////////////////////////////
//:: Kurtizana
//:://////////////////////////////////////////////
//::Odhalen� �iv�tek
/*
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 1. �rovni
Popis: Klidn� si tak post�v� na ulici, kdy� se zni�eho nic objev� str�n� a �enou se na ni. Obkl��� ji, ale ona se nesm� za nic na sv�t� znovu dostat do v�zen�. Je jen jedin� zp�sob jak uniknout.
Poskytuje: Kurtiz�na m��e pou��t tuto odbornost n�kolikr�t denn� (z�visle na sv� �rovni). Proti v�em humanoid�m z�sk�v� nav�c n�kolikan�sobn� zran�n� k4. Proti z�konn�m humanoid�m mu�sk�ho pohlav� je toto zran�n� k6 + bonus z Charismatu jako bonus do �toku.
Trv�n�: Schopnost m� trv�n� 10 tah� ale funguje jen proti nep��tel�m, kte�� byli v dob� aktivace maxim�ln� 10 metr� od kurtiz�ny.
Pou�it�: V�b�rem
Pozn�mka: P�i pou�it� odbornosti P�nov� rad�ji plavovl�sky za brunetku z�sk� Kurtiz�na proti �en�m se z�konn�m p�esv�d�en�m tyt� bonusy jako proti mu��m, kdy� jim odhal� sv�j �iv�tek.
*///::
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
#include "sh_classes_inc_e"
#include "cl_kurt_plav_inc"
void main()
{
    object oPC = OBJECT_SELF;
    object oSoul = GetSoulStone(oPC);
    int iCha = GetAbilityModifier(ABILITY_CHARISMA);
    effect eVis = EffectVisualEffect(VFX_IMP_IMPROVE_ABILITY_SCORE);
    SetLocalInt(oPC,"KURTIZANA_ODHALENY_ZIVUTEK",1);
    int iRacial,iGender;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    int iHairColorType =  GetLocalInt(oSoul,"KURTIZANA_BARVA_TYP");
    if (iCha>0)
    {
        effect eAB = EffectAttackIncrease(iCha);
        eAB = VersusAlignmentEffect(eAB,ALIGNMENT_LAWFUL);
        eAB = SupernaturalEffect(eAB);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eAB,oPC,TurnsToSeconds(10));
    }
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,10.0,GetLocation(oPC),TRUE);
    while (GetIsObjectValid(oTarget))
    {
        iGender = GetGender(oTarget);
        iRacial = GetRacialType(oTarget);
        if ((
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
        )&&
        (iGender == GENDER_MALE ||
        iGender == GENDER_BOTH ||
        iGender == GENDER_NONE ||
        iGender == GENDER_OTHER ||
        iHairColorType == PANOVE_RADEJI_PLAVOVLASKY_BRUNETY
        ))

        {
            SetLocalInt(oTarget,"KURTIZANA_ODHALENY_ZIVUTEK_TARGET",1);
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE,10.0,GetLocation(oPC),TRUE);
    }
    DelayCommand(TurnsToSeconds(10),DeleteLocalInt(oPC,"KURTIZANA_ODHALENY_ZIVUTEK"));

}
