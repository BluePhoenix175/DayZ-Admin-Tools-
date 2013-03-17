if (isnil ("dami_REPAIRplz")) then 
{
    dami_REPAIRplz = 0;
};
 
if (dami_REPAIRplz==0) then
{
    cutText ["LOOK N REPAIR activated.", "PLAIN"];
    dami_REPAIRplz=1;
}
else
{
    cutText ["LOOK N REPAIR deactivated.", "PLAIN"];
    dami_REPAIRplz=0;
};
 
_no_BRO_CODE_R = "while {dami_REPAIRplz==1} do{cursorTarget setdammage 0;sleep 0.5;cursorTarget setvehicleammo 1;sleep 0.5;cursorTarget setfuel 1;sleep 0.05;};";
 
[] spawn compile _no_BRO_CODE_R;