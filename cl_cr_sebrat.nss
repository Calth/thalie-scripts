#include "ku_persist_inc"

void ActionPickUp(object oTarget, string sCollectableItemResRef)
{
    if (GetIsObjectValid(oTarget))
    {
        // Debug
        SendMessageToPC(OBJECT_SELF, "V�sledek: sb�r� " + GetName(oTarget) + ".");
        
        CreateItemOnObject(sCollectableItemResRef, OBJECT_SELF);
        int iDeleted = Persist_DeleteObjectFromDB(oTarget);
        if (iDeleted < 0)
            SendMessageToPC(OBJECT_SELF, "Odstran�n� z persistence se nezda�ilo.");
        DestroyObject(oTarget);
    }
}

void main()
{
    object oTarget = GetNearestObjectToLocation(OBJECT_TYPE_PLACEABLE, GetSpellTargetLocation());
    string sCollectableItemResRef = GetLocalString(oTarget, "PLC_ITEMRESREF");
    
    // Debug
    SendMessageToPC(OBJECT_SELF, "Pou��v� feat Sebrat na: " + GetName(oTarget) + ".");

    if (sCollectableItemResRef != "")
    {
        ActionMoveToLocation(GetLocation(oTarget), FALSE);
        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 3.0f);
        ActionDoCommand(ActionPickUp(oTarget, sCollectableItemResRef));
    }
    else
    {
        // Debug
        SendMessageToPC(OBJECT_SELF, "V�sledek: ��dn�.");
    }
}