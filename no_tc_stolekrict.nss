////////////////////////////////////////
////////////
//////////// najde vsechny veci na stolku s tagem no_tc_vykup +
//////////// co maji promennou tc_cena a podle toho rekne, za kolik by to koupil
///////////////////////////////////////

void main()
{
object no_oPC = GetNearestObjectByTag("no_craf_stol");
object no_Item = GetFirstItemInInventory(no_oPC);
int no_cena = 0;

string no_vykup1 = GetLocalString(OBJECT_SELF,"THINGS_TO_BUY");
string no_vykup2 = GetLocalString(OBJECT_SELF,"THINGS_TO_BUY_2");
string no_vykup3 = GetLocalString(OBJECT_SELF,"THINGS_TO_BUY_3");
string no_vykup4 = GetLocalString(OBJECT_SELF,"THINGS_TO_BUY_4");
string no_vykup5 = GetLocalString(OBJECT_SELF,"THINGS_TO_BUY_5");

while (GetIsObjectValid(no_Item))
        {
       ///if (GetLocalInt(no_Item,"tc_cena") > 0 ){
          string no_resref = GetStringLeft(GetResRef(no_Item),6);

      //takze je to vec co zhanime bo je z craftu
       if ((no_resref==no_vykup1) || (no_resref==no_vykup2)|| (no_resref==no_vykup3)|| (no_resref==no_vykup4) || (no_resref==no_vykup5)   )
       {
            int probehnuti = FALSE;
       if ((GetItemStackSize(no_Item)*GetLocalInt(no_Item,"tc_cena"))> 0 ){
                       no_cena = no_cena + GetItemStackSize(no_Item)*( GetLocalInt(no_Item,"tc_cena"));
                       probehnuti = TRUE;
                                                   }

       if ((FloatToInt(GetItemStackSize(no_Item)*GetLocalFloat(no_Item,"tc_cena"))> 0 )&(probehnuti ==FALSE)){
                       no_cena = no_cena + FloatToInt(GetItemStackSize(no_Item)*( GetLocalFloat(no_Item,"tc_cena")));
                                                 }


                }///kdyz je to to , co chceme
       no_Item = GetNextItemInInventory(no_oPC);
       } //kdyz je valid




if (no_cena > 0 )
{ SpeakString( "Za tohle bych ti dal " + IntToString(no_cena) + " zlatych." ); }
else if  (no_cena == 0 )
{ SpeakString( "Na stolku nevidim nic, co bych koupil" ); }
else if  (no_cena <0 )
{ SendMessageToPC(GetPCSpeaker(), "// debug info, vykupni cena je zaporna !! ");   }

} //main woid
