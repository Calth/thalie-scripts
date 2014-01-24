/*K zemi
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 5. �rovni
Popis: P�iznejme si to, pokud si m� �lov�k vybrat, zda-li ho sraz� k zemi neurval� ork nebo vnadn� d�va, volba je jasn�.
Poskytuje: Kdykoli se pokus� Kurtiz�na pou��t sr�en� proti humanoidovi mu�sk�ho pohlav�, ob� si h�e na V�li proti TO (10 + �rove� Kurtiz�ny) jinak kles� k zemi.
Pou�it�: Kurtiz�na m��e pou��t tuto odbornost libovoln� kr�t za den, ale v�dy aspo� s odstupem 5 tah�. Pokud pou�ije schopnost opakovan� na stejn� c�l, tak je TO p�i ka�d�m dal��m takov�m pokusu o 3 men��. Tato stupnice je zapomenuta sp�nkem �i meditac� c�le.
Trv�n�: 1 kolo
C�l: Humanoidn� bytost mu�sk�ho pohlav�
*/
#include "sh_classes_inc_e"
#include "x0_i0_spells"
void main()
{

    object oTarget = GetSpellTargetObject();
    int iGold = GetGold(oTarget)/1000;
    switch (iGold)
    {
        case 0:
        SendMessageToPC(OBJECT_SELF,"C�l u sebe nem� ��dn� m�ce.");
        break;

        case 1:
        SendMessageToPC(OBJECT_SELF,"C�l u sebe m� jeden m�ec.");
        break;

        case 2:
        case 3:
        case 4:
        SendMessageToPC(OBJECT_SELF,"C�l u sebe m� "+IntToString(iGold)+" m�ce.");
        break;

        default:
        SendMessageToPC(OBJECT_SELF,"C�l u sebe m� "+IntToString(iGold)+" m�c�.");
        break;

    }

}

