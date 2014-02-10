#include "nwnx_events"
#include "mys_emote_lib"

void main()
{
    string sText = GetSelectedNodeText();
    object oPC = GetPCSpeaker();
    
    // *************************************************************************
    // Pok�iky
    // *************************************************************************
    
    if (sText == "bojov� 1")
    {
        ActionPlayEmote(oPC, 14);
    }
    else if (sText == "bojov� 2")
    {
        ActionPlayEmote(oPC, 15);
    }
    else if (sText == "bojov� 3")
    {
        ActionPlayEmote(oPC, 16);
    }
    else if (sText == "v�t�zn� 1")
    {
        ActionPlayEmote(oPC, 11);
    }
    else if (sText == "v�t�zn� 2")
    {
        ActionPlayEmote(oPC, 12);
    }
    else if (sText == "v�t�zn� 3")
    {
        ActionPlayEmote(oPC, 13);
    }
    
    // *************************************************************************
    // Jednor�zov� animace
    // *************************************************************************
    
    else if (sText == "souhlas")
    {
        ActionPlayEmote(oPC, 37);
    }
    else if (sText == "rozpaky")
    {
        ActionPlayEmote(oPC, 8);
    }
    else if (sText == "zam�vat")
    {
        ActionPlayEmote(oPC, 5);
    }
    else if (sText == "salutovat")
    {
        ActionPlayEmote(oPC, 7);
    }
    else if (sText == "�klona")
    {
        ActionPlayEmote(oPC, 1);
    }
    else if (sText == "v�zva")
    {
        ActionPlayEmote(oPC, 10);
    }
    else if (sText == "�hyb")
    {
        ActionPlayEmote(oPC, 2);
    }
    else if (sText == "d�ep")
    {
        ActionPlayEmote(oPC, 4);
    }
    else if (sText == "pr�tah")
    {
        ActionPlayEmote(oPC, 0);
    }
    else if (sText == "okr�st")
    {
        ActionPlayEmote(oPC, 9);
    }
    else if (sText == "�etba")
    {
        ActionPlayEmote(oPC, 6);
    }
    else if (sText == "nap�t se")
    {
        ActionPlayEmote(oPC, 3);
    }
    
    // *************************************************************************
    // Trval� animace
    // *************************************************************************
    
    else if (sText == "le�et na b�i�e")
    {
        ActionPlayEmote(oPC, 22);
    }
    else if (sText == "le�et na z�dech")
    {
        ActionPlayEmote(oPC, 21);
    }
    else if (sText == "d�vat do d�li")
    {
        ActionPlayEmote(oPC, 26);
    }
    else if (sText == "kle�et")
    {
        ActionPlayEmote(oPC, 27);
    }
    else if (sText == "prosit")
    {
        ActionPlayEmote(oPC, 17);
    }
    else if (sText == "�nava")
    {
        ActionPlayEmote(oPC, 29);
    }
    else if (sText == "sm�ch")
    {
        ActionPlayEmote(oPC, 25);
    }
    else if (sText == "opilost")
    {
        ActionPlayEmote(oPC, 20);
    }
    else if (sText == "z�chvat")
    {
        ActionPlayEmote(oPC, 28);
    }
    else if (sText == "hrozit")
    {
        ActionPlayEmote(oPC, 30);
    }
    else if (sText == "uct�vat")
    {
        ActionPlayEmote(oPC, 31);
    }
    else if (sText == "��ry")
    {
        ActionPlayEmote(oPC, 18);
    }
    else if (sText == "��ry nad hlavou")
    {
        ActionPlayEmote(oPC, 19);
    }
    else if (sText == "n�co na zemi")
    {
        ActionPlayEmote(oPC, 23);
    }
    else if (sText == "n�co v �rovni pasu")
    {
        ActionPlayEmote(oPC, 24);
    }
    
    // *************************************************************************
    // Animace sezen�
    // *************************************************************************
    
    else if (sText == "sed�t na zemi")
    {
        ActionPlayEmote(oPC, 32);
    }
    else if (sText == "sed�t na n��em")
    {
        ActionPlayEmote(oPC, 33);
    }
    else if (sText == "sed�t na nejbli��� v�ci")
    {
        ActionPlayEmote(oPC, 34);
    }
    else if (sText == "��st v sed�")
    {
        ActionPlayEmote(oPC, 36);
    }
    else if (sText == "nap�t se v sed�")
    {
        ActionPlayEmote(oPC, 35);
    }
    
    // *************************************************************************
    // Ostatn� animace
    // *************************************************************************
    
    else if (sText == "kou�it")
    {
        ActionPlayEmote(oPC, 39);
    }
    else if (sText == "tanec")
    {
        ActionPlayEmote(oPC, 38);
    }
    else
    {
        SendMessageToPC(oPC, "Chyba: neur�en� animace.");
    }
}