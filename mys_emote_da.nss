#include "nwnx_events"
#include "mys_emote_lib"

string GetDialogActionText(string sText)
{
    return "<StartAction>[" + sText + "]</Start>";
}

void main()
{
    string sText = GetSelectedNodeText();
    object oPC = GetPCSpeaker();
    
    // *************************************************************************
    // Pok�iky
    // *************************************************************************
    
    if (sText == GetDialogActionText("bojov� 1"))
    {
        ActionPlayEmote(oPC, 14);
    }
    else if (sText == GetDialogActionText("bojov� 2"))
    {
        ActionPlayEmote(oPC, 15);
    }
    else if (sText == GetDialogActionText("bojov� 3"))
    {
        ActionPlayEmote(oPC, 16);
    }
    else if (sText == GetDialogActionText("v�t�zn� 1"))
    {
        ActionPlayEmote(oPC, 11);
    }
    else if (sText == GetDialogActionText("v�t�zn� 2"))
    {
        ActionPlayEmote(oPC, 12);
    }
    else if (sText == GetDialogActionText("v�t�zn� 3"))
    {
        ActionPlayEmote(oPC, 13);
    }
    
    // *************************************************************************
    // Jednor�zov� animace
    // *************************************************************************
    
    else if (sText == GetDialogActionText("souhlas"))
    {
        ActionPlayEmote(oPC, 47);
    }
    else if (sText == GetDialogActionText("rozpaky"))
    {
        ActionPlayEmote(oPC, 8);
    }
    else if (sText == GetDialogActionText("zam�vat"))
    {
        ActionPlayEmote(oPC, 5);
    }
    else if (sText == GetDialogActionText("salutovat"))
    {
        ActionPlayEmote(oPC, 7);
    }
    else if (sText == GetDialogActionText("�klona"))
    {
        ActionPlayEmote(oPC, 1);
    }
    else if (sText == GetDialogActionText("v�zva"))
    {
        ActionPlayEmote(oPC, 10);
    }
    else if (sText == GetDialogActionText("�hyb"))
    {
        ActionPlayEmote(oPC, 2);
    }
    else if (sText == GetDialogActionText("d�ep"))
    {
        ActionPlayEmote(oPC, 4);
    }
    else if (sText == GetDialogActionText("pr�tah"))
    {
        ActionPlayEmote(oPC, 0);
    }
    else if (sText == GetDialogActionText("okr�st"))
    {
        ActionPlayEmote(oPC, 9);
    }
    else if (sText == GetDialogActionText("�etba"))
    {
        ActionPlayEmote(oPC, 6);
    }
    else if (sText == GetDialogActionText("nap�t se"))
    {
        ActionPlayEmote(oPC, 3);
    }
    else if (sText == GetDialogActionText("skok"))
    {
        ActionPlayEmote(oPC, 38);
    }
    
    // *************************************************************************
    // Trval� animace
    // *************************************************************************
    
    else if (sText == GetDialogActionText("zalo�it ruce"))
    {
        ActionPlayEmote(oPC, 37);
    }
    else if (sText == GetDialogActionText("p�em��let"))
    {
        ActionPlayEmote(oPC, 35);
    }
    else if (sText == GetDialogActionText("d�vat do d�li"))
    {
        ActionPlayEmote(oPC, 26);
    }
    else if (sText == GetDialogActionText("zakleknout"))
    {
        ActionPlayEmote(oPC, 40);
    }
    else if (sText == GetDialogActionText("kle�et"))
    {
        ActionPlayEmote(oPC, 27);
    }
    else if (sText == GetDialogActionText("prosit"))
    {
        ActionPlayEmote(oPC, 17);
    }
    else if (sText == GetDialogActionText("uk�zat"))
    {
        ActionPlayEmote(oPC, 34);
    }
    else if (sText == GetDialogActionText("pob�zet"))
    {
        ActionPlayEmote(oPC, 39);
    }
    else if (sText == GetDialogActionText("hrozit"))
    {
        ActionPlayEmote(oPC, 30);
    }
    else if (sText == GetDialogActionText("kr�t hlavu"))
    {
        ActionPlayEmote(oPC, 36);
    }    
    else if (sText == GetDialogActionText("�nava"))
    {
        ActionPlayEmote(oPC, 29);
    }
    else if (sText == GetDialogActionText("sm�ch"))
    {
        ActionPlayEmote(oPC, 25);
    }
    else if (sText == GetDialogActionText("opilost"))
    {
        ActionPlayEmote(oPC, 20);
    }
    else if (sText == GetDialogActionText("z�chvat"))
    {
        ActionPlayEmote(oPC, 28);
    }
    else if (sText == GetDialogActionText("uct�vat"))
    {
        ActionPlayEmote(oPC, 31);
    }
    else if (sText == GetDialogActionText("��ry"))
    {
        ActionPlayEmote(oPC, 18);
    }
    else if (sText == GetDialogActionText("��ry nad hlavou"))
    {
        ActionPlayEmote(oPC, 19);
    }
    else if (sText == GetDialogActionText("n�co na zemi"))
    {
        ActionPlayEmote(oPC, 23);
    }
    else if (sText == GetDialogActionText("n�co v �rovni pasu"))
    {
        ActionPlayEmote(oPC, 24);
    }
    
    // *************************************************************************
    // Animace sezen�
    // *************************************************************************
    
    else if (sText == GetDialogActionText("sed�t na zemi"))
    {
        ActionPlayEmote(oPC, 32);
    }
    else if (sText == GetDialogActionText("sed�t na n��em"))
    {
        ActionPlayEmote(oPC, 33);
    }
    else if (sText == GetDialogActionText("sed�t na nejbli��� v�ci"))
    {
        ActionPlayEmote(oPC, 44);
    }
    else if (sText == GetDialogActionText("��st v sed�"))
    {
        ActionPlayEmote(oPC, 46);
    }
    else if (sText == GetDialogActionText("nap�t se v sed�"))
    {
        ActionPlayEmote(oPC, 45);
    }
    
    // *************************************************************************
    // Animace le�en�
    // *************************************************************************
    
    else if (sText == GetDialogActionText("le�et na b�i�e"))
    {
        ActionPlayEmote(oPC, 22);
    }
    else if (sText == GetDialogActionText("le�et na z�dech"))
    {
        ActionPlayEmote(oPC, 21);
    }
    else if (sText == GetDialogActionText("le�et na boku"))
    {
        ActionPlayEmote(oPC, 43);
    }
    
    // *************************************************************************
    // Ostatn� animace
    // *************************************************************************
    
    else if (sText == GetDialogActionText("kou�it"))
    {
        ActionPlayEmote(oPC, 49);
    }
    else if (sText == GetDialogActionText("tanec"))
    {
        ActionPlayEmote(oPC, 48);
    }
    else if (sText == GetDialogActionText("rubat"))
    {
        ActionPlayEmote(oPC, 42);
    }
    else if (sText == GetDialogActionText("viset"))
    {
        ActionPlayEmote(oPC, 41);
    }
    
    // *************************************************************************
    // Zvukov� projevy
    // *************************************************************************
    else if (sText == GetDialogActionText("p�skat si"))
    {
        ActionPlaySoundEmote(oPC, 0);
    }
    else if (sText == GetDialogActionText("krknout"))
    {
        ActionPlaySoundEmote(oPC, 1);
    }
    else if (sText == GetDialogActionText("odplivnout"))
    {
        ActionPlaySoundEmote(oPC, 2);
    }
    else if (sText == GetDialogActionText("k�chnout"))
    {
        ActionPlaySoundEmote(oPC, 3);
    }
    else if (sText == GetDialogActionText("ka�lat"))
    {
        ActionPlaySoundEmote(oPC, 4);
    }
    else if (sText == GetDialogActionText("z�vnout"))
    {
        ActionPlaySoundEmote(oPC, 5);
    }
    else if (sText == GetDialogActionText("chr�pat"))
    {
        ActionPlaySoundEmote(oPC, 6);
    }
    else if (sText == GetDialogActionText("pl��"))
    {
        ActionPlaySoundEmote(oPC, 7);
    }
    else if (sText == GetDialogActionText("modlen�"))
    {
        ActionPlaySoundEmote(oPC, 8);
    }    
    
    else
    {
        SendMessageToPC(oPC, "Chyba: neur�en� animace.");
    }
}