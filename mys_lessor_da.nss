#include "nwnx_events"
#include "mys_hen_lib"

void main()
{
    string sText = GetSelectedNodeText();
    object oPC = GetPCSpeaker();
    int i = GetLocalInt(oPC, "KU_CHAT_CACHE_INDEX");
    string sChat = GetLocalString(oPC, "KU_CHAT_CACHE_" + IntToString(i));
    
    if (sText == "Chci si pronajmout zv��e na rok.")
    {
        object oHenchman = GetHenchmanByName(OBJECT_SELF, sChat);
        if (GetIsObjectValid(oHenchman))
        {
            int bHired = HireHenchman(oHenchman, oPC, OBJECT_SELF);
            if (bHired)
            {
                DestroyObject(oHenchman);
                SendMessageToPC(oPC, "D�kuji za obchod. Zv��e je tv�.");                        
            }
            else
                SendMessageToPC(oPC, "Nesrovnalosti mi zabr�nily ti zv��e pronajmout.");
        }
    }
    else if (sText == "Chci prodlou�it n�jem o rok.")
    {
        object oKey = GetKeyByName(oPC, sChat);
        if (GetIsObjectValid(oKey))
        {
            int bExtended = ExtendHenchmanKey(oKey, OBJECT_SELF);
            if (bExtended)
                SendMessageToPC(oPC, "Tv�j pron�jem byl prodlou�en o dal�� rok.");                        
            else
                SendMessageToPC(oPC, "Nesrovnalosti mi zabr�nily prodlou�it pron�jem.");
        }
    }
    else
    {
        SendMessageToPC(oPC, "Chyba: neur�en� akce.");
    }
}
