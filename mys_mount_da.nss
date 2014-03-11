#include "nwnx_events"
#include "mys_hen_lib"
#include "mys_mount_lib"

void main()
{
    string sText = GetSelectedNodeText();
    object oPC = GetPCSpeaker();
    
    if (sText == "<StartAction>[Odvolat]</Start>")
    {
        object oKey = GetKeyByName(oPC, GetName(OBJECT_SELF));
        DeleteLocalObject(oKey, "HENCHMAN");
        SetLocalInt(oKey, "HENCHMAN_USES", 1);
        ClearAllActions(TRUE);
        DestroyObject(OBJECT_SELF);
    }
    else if (sText == "<StartAction>[Do party]</Start>")
    {
        if (!GetIsObjectValid(GetMaster(OBJECT_SELF)))
        {
            SetCommandable(TRUE);
            AddHenchman(oPC, OBJECT_SELF);
            // for /h chat command
            SetLocalObject(oPC, "HENCHMAN", OBJECT_SELF);
        }
    }    
    else if (sText == "<StartAction>[P�ejmenovat zv��e]</Start>")
    {
        int i = GetLocalInt(oPC, "KU_CHAT_CACHE_INDEX");
        string sNewName = GetLocalString(oPC, "KU_CHAT_CACHE_" + IntToString(i));
        int bRenamed = RenameHenchman(OBJECT_SELF, sNewName);
        
        if (bRenamed)
            SendMessageToPC(oPC, "Jm�no zm�n�no na: " + sNewName + ".");
        else
            SendMessageToPC(oPC, "Zm�na jm�na se nezda�ila.");
    }
    else if (sText == "Pronajmout zv��e na p�l roku.")
    {
        if (GetIsObjectValid(OBJECT_SELF))
        {
            object oKey = HireHenchman(OBJECT_SELF, oPC, OBJECT_INVALID, 0.5f);
            if (GetIsObjectValid(oKey))
            {
                StoreMountInfo(OBJECT_SELF, oKey);
                SendMessageToPC(oPC, "Zv��e je tv�. Pron�jem vypr�� za p�l roku.");                        
            }
            else
                SendMessageToPC(oPC, "Nesrovnalosti ti zabr�nily pronajmout si zv��e.");
        }
        else
            SendMessageToPC(oPC, "Zv��e nen� k dispozici.");
    }
    else if (sText == "Pronajmout zv��e na 1 rok.")
    {
        if (GetIsObjectValid(OBJECT_SELF))
        {
            object oKey = HireHenchman(OBJECT_SELF, oPC);
            if (GetIsObjectValid(oKey))
            {
                StoreMountInfo(OBJECT_SELF, oKey);
                SendMessageToPC(oPC, "Zv��e je tv�. Pron�jem vypr�� za rok.");                        
            }
            else
                SendMessageToPC(oPC, "Nesrovnalosti ti zabr�nily pronajmout si zv��e.");
        }
        else
            SendMessageToPC(oPC, "Zv��e nen� k dispozici.");
    }
    else
    {
        SendMessageToPC(oPC, "Chyba: neur�en� akce.");
    }
}
