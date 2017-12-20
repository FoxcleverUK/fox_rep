* -
* - GK 17-07-2015 : 
* -

Cd C:\DevArea\Cadomel\Data

Clear
Set Exclusive Off
Set Deleted Off
Set Reprocess To 1 seconds

lnNoOfTables	= ADir(laDir, '*.dbf')

? 'Number of Tables: '
?? lnNoOfTables
?

For i = 1 to lnNoOfTables		&& Alen(laDir, 1)
	Clear Error
	
	? ladir(i, 1)
	
	Use (ladir(i, 1)) Shared Noupdate Alias tbl
	?? ' - used'
	
	lnRecCount	= Reccount()
	If lnRecCount > 0
		Go lnRecCount
		Wait window 'Tbl: ' + ladir(i, 1) nowait
		Locate
		If Rlock()
			?? ' - locked'
		Else
			?? ' - *** nolock (' + Message() + ')'
		EndIf
		
	Else
	
	EndIf
	
	Use in (Select('tbl'))
	
EndFor
Wait clear

Set Deleted On
Set Reprocess To automatic

?
? 'End.'
