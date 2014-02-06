#include "ku_persist_inc"

void main()
{
    object oTarget = GetNearestObjectToLocation(OBJECT_TYPE_PLACEABLE, GetSpellTargetLocation());
    string sCollectableItemResRef = GetLocalString(oTarget, "collectableItemResRef");
    
    // Debug
    SendMessageToPC(OBJECT_SELF, "Pou��v� feat Sebrat na: " + GetName(oTarget) + ".");

    if (sCollectableItemResRef != "")
    {
        // Debug
        SendMessageToPC(OBJECT_SELF, "V�sledek: sb�r� " + GetName(oTarget) + ".");
        
        CreateItemOnObject(sCollectableItemResRef, OBJECT_SELF);
        Persist_DeleteObjectFromDB(oTarget);
        DestroyObject(oTarget);
    }
    else
    {
        // Debug
        SendMessageToPC(OBJECT_SELF, "V�sledek: ��dn�.");
    }
}