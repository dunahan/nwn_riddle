void d(string sMessage)
{
  SendMessageToPC(GetFirstPC(), "[DEBUG] "+sMessage);
}

void SendServerMessageToPC(object oPlayer, string sMessage)
{
  SendMessageToPC(oPlayer, "[Server] "+sMessage);
}

void restart()
{
  StartNewModule("riddle");
}
