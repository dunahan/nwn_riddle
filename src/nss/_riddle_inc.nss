#include "NW_O2_CONINCLUDE"
#include "x2_inc_itemprop"
#include "_debug_inc"

string GenerateRandomRiddleWord()
{
  string sReturn;   // leave it empty
  int nRandom = 4;

  switch (Random(nRandom+1))
  {
    case 1:  sReturn = "EARS"; break;
    case 2:  sReturn = "KNOW"; break;
    case 3:  sReturn = "NOSE"; break;
    case 4:  sReturn = "ROSE"; break;
    default: sReturn = "ROSE"; break;
  }

  return sReturn;
}

string GenerateQuestionFromRiddleWord(string sWord)    // could be turned in a switch/case
{
  string sReturn;

  if (sWord == "EARS")
    sReturn = "You have two of them on your head.";
  else if (sWord == "KNOW")
    sReturn = "If you are aware of something you ... it.";
  else if (sWord == "NOSE")
    sReturn = "You need it to smell something.";
  else if (sWord == "ROSE")
    sReturn = "These flowers smell beautiful, but have thorns.";
  else
    sReturn = "ERROR, there went something wrong. Tell Staff!";

  return sReturn;
}




