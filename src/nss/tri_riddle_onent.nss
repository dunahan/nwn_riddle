#include "_riddle_inc"

void main()
{
  // get the chest and the pc
  object oChest = GetObjectByTag("riddle_chest"), oMonster;
  object oPC = GetEnteringObject();

  // Get the riddle word and the hint
  string sWord = GetLocalString(oChest, "Word");
  string sRiddle = GetLocalString(oChest, "Riddle");

  // Where to spawn the enemy?
  string sDice = IntToString( d3() );

  // Main routine
  // Get the tag
  string sTag = GetTag(OBJECT_SELF);

  // collect the letters and compaire them...
  // the toon collected the right letters
  if (GetLocalString(oPC, "Answer") + sTag == sWord)
    FloatingTextStringOnCreature("WON", oPC, FALSE);

  // the toon is collectin still
  else if (GetLocalString(oPC, "Answer") != sWord &&
           GetStringLength(GetLocalString(oPC, "Answer")) <= 3)
    SetLocalString(oPC, "Answer", GetLocalString(oPC, "Answer") + sTag);

  // the toon has the wrong answer...
  else if (GetStringLength(GetLocalString(oPC, "Answer")) == 4 ||
           GetLocalString(oPC, "Answer") != sWord)
  {
    oMonster = CreateObject(OBJECT_TYPE_CREATURE, "nw_chicken", GetLocation(GetWaypointByTag("sp_monster_0"+IntToString(Random(3)+1))));
    ChangeToStandardFaction(oMonster, STANDARD_FACTION_HOSTILE);
    AssignCommand(oMonster, ActionAttack(oPC));
    DeleteLocalString(oPC, "Answer");
  }

  d(GetLocalString(oPC, "Answer"));
}
