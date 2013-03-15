//display message (center of screen) on player login
"dayzLoginRecord" addPublicVariableEventHandler
{
hint parseText format ["<t size='1.1'font='Bitstream'align='center'>Welcome, %1</t>", name player];
            cutText [format ["Welcome, %1", name player], "PLAIN"];
            sleep 3;
            cutText ["This is a NO-PVP SERVER!", "PLAIN"];
            sleep 3;
            cutText ["To enable debug set hot-key in custom controls action #20", "PLAIN"];
            sleep 3;
            cutText ["Be sure to visit us at NorthStarGaming.net", "PLAIN"];
            sleep 3;
            cutText ["Have fun!", "PLAIN"]";
};