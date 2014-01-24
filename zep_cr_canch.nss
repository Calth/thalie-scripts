#include "zep_inc_craft"

int StartingConditional() {
    object oPC = GetPCSpeaker();
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    if (!GetIsObjectValid(oHelmet) || GetPlotFlag(oHelmet))
        return FALSE;

    if (GetIsDM(oPC)) return TRUE;

    string sRequired = "ZEP_CR_HELMET";
    object oNPC = GetLocalObject(oPC, "ZEP_CR_NPC");
    if (GetIsObjectValid(oNPC)) {
        if (GetLocalInt(oNPC, sRequired) == 1)
            return TRUE;
        else return FALSE;

    } else if (ZEP_CR_REQUIRE_PLACEABLE) {
        int i=1;
        object oPlaceable = GetNearestObjectByTag(ZEP_CR_PLACEABLE_TAG, oPC, 1);
        while (GetIsObjectValid(oPlaceable) && GetArea(oPC) == GetArea(oPlaceable)
            && GetDistanceBetween(oPC, oPlaceable) <= ZEP_CR_REQUIRED_DISTANCE) {
            if (GetLocalInt(oPlaceable, sRequired) == 1)
                return TRUE;
            oPlaceable = GetNearestObjectByTag(ZEP_CR_PLACEABLE_TAG, oPC, ++i);
        }
        return FALSE;
    }
    return TRUE;
}

