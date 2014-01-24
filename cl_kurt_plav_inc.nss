/*
P�nov� rad�ji plavovl�sky - epick�
Druh dovednosti: Povol�n�
P�edpoklady: Kurtiz�na na 20. �rovni
Popis: N�kte�� p�nov� maj� rad�ji plavovl�sky, jin� si potrp� v�ce na tmavovl�sky a dal�� na zrzky. ��dn� Kurtiz�na nechce p�ij�t o k�eft jen proto, �e jej� barva vlas� nen� zrovna ��dan�. Kurtiz�na dok�e hodinovou usilovnou meditac� zm�nit svou barvu vlas� na 24 hodin. Spolu se zm�nou barvy z�sk�v� tak� do�asn� bonusy z t�to barvy plynouc�. Ze sv� p��rodn� barvy vlas� nedost�v� Kurtiz�na ��dn� bonus, m��e v�ak do�asn� "zm�nit" sv� vlasy na stejn� odst�n, ��m� tyto bonusy po dobu 24 hodin m� k dispozici. Jeliko� jde o zvl�tn� schopnost, funguje i v oblastech, kde je jinak magie ru�ena.
Poskytuje:
PLAVOVL�SKA - Blond�na um� ode��st body ze sv� Inteligence a� po hodnotu 10 a ode�ten� body m��e p�i��st do TO sv�ch schopnost�.
BRUNETKA - Brunetka dok�e pou��t odbornost Ob�as to p�edst�r�m tolikr�t za den, jak� je jej� bonus Charismatu. Nav�c um� "hr�t na ob� strany", co� znamen�, �e v�echny sv� schopnosti v�zan� na pohlav� ob�ti m��e po dobu 24 hodin vyu��t i proti �en�m.
ZRZKA - Kdy� se rudovl�ska rozzu��, vyd� ze sebe v�echno. B�hem zu�ivosti z Jak jsi mi to �ekl?! se zrzka dok�e rozohnit tak, a� doslova sr�� jiskrami. Kurtiz�na takto d�v� nav�c zran�n� ohn�m, kter� je rovno 1k6 za ka�d� 2 �rovn� Kurtiz�ny (nap�. 10k6 pro postavu s 20 �rovn�mi tohoto povol�n�). Je imunn� v��i zran�n� sv�m vlastn�m ohn�m a z�sk�v� pohlcen� 10/- v��i jak�mukoli jin�mu (magick�mu i b�n�mu) ohni. Bonus do zu�ivosti lze pou��t jen kdy� Kurtiz�na bojuje d�kou.
Bruneta - 119
Zrzka- 35
Plavovl�ska - 154
*/
#include "sh_classes_inc_e"
#include "sh_classes_const"
const int PANOVE_RADEJI_PLAVOVLASKY_VYCHOZI = 0;
const int PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKY = 1;
const int PANOVE_RADEJI_PLAVOVLASKY_BRUNETY = 2;
const int PANOVE_RADEJI_PLAVOVLASKY_ZRZKY = 3;

const int PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKA_BARVA = 154;
const int PANOVE_RADEJI_PLAVOVLASKY_BRUNETA_BARVA = 119;
const int PANOVE_RADEJI_PLAVOVLASKY_ZRZKA_BARVA = 35;

void PanoveRadiPlavovlaskyBarvaVlasu(object oKurtizana)
{
    object oSoul = GetSoulStone(oKurtizana);
    int iBaseColor = GetLocalInt(oSoul,"KURTIZANA_ZAKLADNI_BARVA");
    int iOldColor = GetColor(oKurtizana,COLOR_CHANNEL_HAIR);
    int iType = GetLocalInt(oSoul,"KURTIZANA_PANOVE_RADEJI_PLAVOVLASKY_VYBER");
    if (GetHasFeat(FEAT_KURTIZANA_PANOVE_RADEJI_PLAVOVLASKY,oKurtizana))
    {
        switch(iType)
        {
            case PANOVE_RADEJI_PLAVOVLASKY_VYCHOZI:
                SetColor(oKurtizana,COLOR_CHANNEL_HAIR,iBaseColor);
                SetLocalInt(oSoul,"KURTIZANA_BARVA_TYP",PANOVE_RADEJI_PLAVOVLASKY_VYCHOZI);
            break;
            case PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKY:
                if (iOldColor != PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_BRUNETA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_ZRZKA_BARVA)SetLocalInt(oSoul,"KURTIZANA_ZAKLADNI_BARVA",iOldColor);
                SetColor(oKurtizana,COLOR_CHANNEL_HAIR,PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKA_BARVA);
                SetLocalInt(oSoul,"KURTIZANA_BARVA_TYP",PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKY);
            break;
            case PANOVE_RADEJI_PLAVOVLASKY_BRUNETY:
                if (iOldColor != PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_BRUNETA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_ZRZKA_BARVA)SetLocalInt(oSoul,"KURTIZANA_ZAKLADNI_BARVA",iOldColor);
                SetColor(oKurtizana,COLOR_CHANNEL_HAIR,PANOVE_RADEJI_PLAVOVLASKY_BRUNETA_BARVA);
                SetLocalInt(oSoul,"KURTIZANA_BARVA_TYP",PANOVE_RADEJI_PLAVOVLASKY_BRUNETY);
            break;
            case PANOVE_RADEJI_PLAVOVLASKY_ZRZKY:
                if (iOldColor != PANOVE_RADEJI_PLAVOVLASKY_PLAVOVLASKA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_BRUNETA_BARVA && iOldColor != PANOVE_RADEJI_PLAVOVLASKY_ZRZKA_BARVA)SetLocalInt(oSoul,"KURTIZANA_ZAKLADNI_BARVA",iOldColor);
                SetColor(oKurtizana,COLOR_CHANNEL_HAIR,PANOVE_RADEJI_PLAVOVLASKY_ZRZKA_BARVA);
                SetLocalInt(oSoul,"KURTIZANA_BARVA_TYP",PANOVE_RADEJI_PLAVOVLASKY_ZRZKY);
            break;

        }
        //int iBaseBarva = GetLocalInt(oSoul,"KURTIZANA_ZAKLADNI_BARVA");
        //SetLocalInt(oSoul,"KURTIZANA_PANOVE_RADEJI_PLAVOVLASKY_VYBER",PANOVE_RADEJI_PLAVOVLASKY_VYCHOZI);
        //SendMessageToPC(OBJECT_SELF,"Po meditaci budes mit puvodni barvu vlasu.");
        //SetColor(oTarget,COLOR_CHANNEL_HAIR,iDMSetNumber);
    }

}
