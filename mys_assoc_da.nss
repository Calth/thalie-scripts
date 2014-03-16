#include "nwnx_events"
#include "me_soul_inc"
#include "mys_assoc_lib"

void AssocSetName(object oPC, int iAssociateType)
{
    object oAssociate = GetAssociate(iAssociateType, oPC);
    object oSoul = GetSoulStone(GetMaster(oAssociate));
    int i = GetLocalInt(oPC, "KU_CHAT_CACHE_INDEX");
    string sNewName = GetLocalString(oPC, "KU_CHAT_CACHE_" + IntToString(i));

    if (sNewName != "")
    {
        SetAssociateName(oSoul, oAssociate, iAssociateType, sNewName);
        SendMessageToPC(oPC, "Jm�no zm�n�no na: " + sNewName + ".");
        return;
    }
    SendMessageToPC(oPC, "Zm�na jm�na se nezda�ila.");
}

void AssocSetAppearance(object oPC, int iAssociateType)
{
    object oAssociate = GetAssociate(iAssociateType, oPC);
    object oSoul = GetSoulStone(GetMaster(oAssociate));
    int iCurrentVal = GetAssociateAppearanceType(oSoul, oAssociate, iAssociateType);
    string sList = "," + GetAssociateAppearanceList(GetAssociateTagSignature(GetTag(oAssociate)));
    string sTempVarName = "TEMP_ASSOC_APP";
    
    // List parsing
    int iVal, iTempVal, iCounter, iPointerPos, iPointerNextPos, iNextValVarIndex;
    
    // Delete temp array
    iTempVal = GetLocalInt(oAssociate, sTempVarName + "0");
    while(iTempVal)
    {
        DeleteLocalInt(oAssociate, sTempVarName + IntToString(iCounter));
        iCounter ++;
        iTempVal = GetLocalInt(oAssociate, sTempVarName + IntToString(iCounter));
    }
    
    // Set up temp array
    iCounter = 0;
    iPointerPos = 1;
    iPointerNextPos = FindSubString(sList, ",", iPointerPos);
    
    while(iPointerPos)
    {
        iVal = StringToInt(GetSubString(sList, iPointerPos, iPointerNextPos - iPointerPos));
        SetLocalInt(oAssociate, sTempVarName + IntToString(iCounter), iVal);
        if (iVal == iCurrentVal)
        {
            iNextValVarIndex = iCounter + 1;
        }
        iPointerPos = iPointerNextPos + 1;
        iPointerNextPos = FindSubString(sList, ",", iPointerPos);
        iCounter ++;
    }
    
    iVal = GetLocalInt(oAssociate, sTempVarName + IntToString(iNextValVarIndex));
    if (!iVal) iVal = GetLocalInt(oAssociate, sTempVarName + "0");
    
    // Delete temp array
    iCounter = 0;
    iTempVal = GetLocalInt(oAssociate, sTempVarName + "0");
    
    while(iTempVal)
    {
        DeleteLocalInt(oAssociate, sTempVarName + IntToString(iCounter));
        iCounter ++;
        iTempVal = GetLocalInt(oAssociate, sTempVarName + IntToString(iCounter));
    }
    
    if (iVal)
    {    
        SetAssociateAppearanceType(oSoul, oAssociate, iAssociateType, iVal);
        SendMessageToPC(oPC, "Zm�na vzhledu provedena.");
    }
    else
        SendMessageToPC(oPC, "Zm�na vzhledu se nezda�ila.");
}

void main()
{
    string sText = GetSelectedNodeText();
    object oPC = GetPCSpeaker();
    
    //--------------------------------------------------------------------------
    // ANIMAL
    //--------------------------------------------------------------------------
    
    if (sText == "<StartAction>[Zm�nit vzhled zv��ete]</Start>")
    {
        AssocSetAppearance(oPC, ASSOCIATE_TYPE_ANIMALCOMPANION);
    }
    else if (sText == "<StartAction>[P�ejmenovat zv��e]</Start>")
    {
        AssocSetName(oPC, ASSOCIATE_TYPE_ANIMALCOMPANION);
    }
    
    //--------------------------------------------------------------------------
    // FAMILIAR
    //--------------------------------------------------------------------------
    
    else if (sText == "<StartAction>[Zm�nit vzhled druha]</Start>")
    {
        AssocSetAppearance(oPC, ASSOCIATE_TYPE_FAMILIAR);
    }
    else if (sText == "<StartAction>[P�ejmenovat druha]</Start>")
    {
        AssocSetName(oPC, ASSOCIATE_TYPE_FAMILIAR);
    }

}
