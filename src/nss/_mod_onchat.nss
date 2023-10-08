#include "_debug_inc"

void main()
{
  object oPC = GetPCChatSpeaker();
  string sChat = GetStringLowerCase(GetPCChatMessage());

  if (sChat == "help")
    SendMessageToPC(oPC, "Type rld for the module to be reloaded\n");
  else if (sChat == "rld")
    restart();

}
