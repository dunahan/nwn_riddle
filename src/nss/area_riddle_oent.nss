#include "_riddle_inc"

void main()
{
  d("Running script <area_riddle_oent");

  string sWord = GenerateRandomRiddleWord();                                    d("Random choosen word: "+sWord);
  string sRiddle = GenerateQuestionFromRiddleWord(sWord);                       d("The question for it: "+sRiddle);

  object oChest = GetObjectByTag("riddle_chest"), oScroll;
  location locChest = GetLocation(GetWaypointByTag("wp_riddle_chest"));

  // Does the chest exist? Create it with the scroll inside.
  if (GetIsObjectValid(oChest) == FALSE)
  {
    d("Chest missing! Creating chest for system.");
    oChest = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_chest1", locChest, FALSE, "riddle_chest");
    SetEventScript(oChest, EVENT_SCRIPT_PLACEABLE_ON_DEATH, "");
    SetEventScript(oChest, EVENT_SCRIPT_PLACEABLE_ON_OPEN, "");

    d("Scroll missing! Creating scroll for system.");
    oScroll = CreateItemOnObject("x0_misc_lyrics", oChest, 1, "riddle_scroll");
    SetDescription(oScroll, sRiddle, FALSE);
    SetDescription(oScroll, sRiddle, TRUE);
    SetIdentified(oScroll, TRUE);
    SetName(oScroll, "Scroll of Riddles");

    itemproperty ip = GetFirstItemProperty(oScroll);
    while (GetIsItemPropertyValid(ip))
    {
      RemoveItemProperty(oScroll, ip);

      ip = GetNextItemProperty(oScroll);
    }
  }

  SetLocalString(oChest, "Word", sWord);                                        d("Set word: "+GetLocalString(oChest, "Word"));
  SetLocalString(oChest, "Riddle", sRiddle);                                    d("Set riddle: "+GetLocalString(oChest, "Riddle"));



  SetEventScript(OBJECT_SELF, EVENT_SCRIPT_AREA_ON_ENTER,"");   // this should only fire once
}
