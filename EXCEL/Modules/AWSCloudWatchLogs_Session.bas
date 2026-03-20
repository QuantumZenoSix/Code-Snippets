Attribute VB_Name = "AWSCloudWatchLogs_Session"
Sub AWSCloudWatchLogSlimmer_Session()
Attribute AWSCloudWatchLogSlimmer_Session.VB_Description = "For csvs where theres no username, but instead session details."
Attribute AWSCloudWatchLogSlimmer_Session.VB_ProcData.VB_Invoke_Func = "r\n14"
'
' AWSCloudWatchLogSlimmer_Session Macro
' For csvs where theres no username, but instead session details. Returns unique entries only.
'
' Keyboard Shortcut: Ctrl+r
'
    Columns("A:A").Select
    Selection.Delete Shift:=xlToLeft
    Selection.Delete Shift:=xlToLeft
    Columns("B:B").Select
    ActiveWindow.SmallScroll ToRight:=2
    Columns("E:E").Select
    ActiveWindow.SmallScroll ToRight:=3
    Columns("E:H").Select
    Range("H1").Activate
    Selection.Delete Shift:=xlToLeft
    Range("B17").Select
    ActiveWindow.SmallScroll ToRight:=2
    Columns("F:F").Select
    ActiveWindow.SmallScroll ToRight:=4
    Columns("F:K").Select
    Selection.Delete Shift:=xlToLeft
    Columns("H:H").Select
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 10
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 14
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 21
    ActiveWindow.ScrollColumn = 22
    ActiveWindow.ScrollColumn = 23
    ActiveWindow.ScrollColumn = 24
    ActiveWindow.ScrollColumn = 25
    ActiveWindow.ScrollColumn = 26
    ActiveWindow.ScrollColumn = 27
    ActiveWindow.ScrollColumn = 28
    ActiveWindow.ScrollColumn = 30
    ActiveWindow.ScrollColumn = 31
    ActiveWindow.ScrollColumn = 32
    ActiveWindow.ScrollColumn = 33
    ActiveWindow.ScrollColumn = 34
    ActiveWindow.ScrollColumn = 35
    ActiveWindow.ScrollColumn = 36
    ActiveWindow.ScrollColumn = 37
    ActiveWindow.ScrollColumn = 38
    ActiveWindow.ScrollColumn = 39
    ActiveWindow.ScrollColumn = 40
    ActiveWindow.ScrollColumn = 41
    ActiveWindow.ScrollColumn = 42
    ActiveWindow.ScrollColumn = 43
    ActiveWindow.ScrollColumn = 44
    ActiveWindow.ScrollColumn = 45
    ActiveWindow.ScrollColumn = 46
    ActiveWindow.ScrollColumn = 47
    ActiveWindow.ScrollColumn = 48
    ActiveWindow.ScrollColumn = 49
    ActiveWindow.ScrollColumn = 50
    ActiveWindow.ScrollColumn = 51
    ActiveWindow.ScrollColumn = 52
    ActiveWindow.ScrollColumn = 54
    ActiveWindow.ScrollColumn = 55
    ActiveWindow.ScrollColumn = 56
    ActiveWindow.ScrollColumn = 57
    ActiveWindow.ScrollColumn = 58
    ActiveWindow.ScrollColumn = 59
    ActiveWindow.ScrollColumn = 60
    ActiveWindow.ScrollColumn = 61
    ActiveWindow.ScrollColumn = 62
    ActiveWindow.ScrollColumn = 63
    ActiveWindow.ScrollColumn = 64
    ActiveWindow.ScrollColumn = 65
    ActiveWindow.ScrollColumn = 66
    ActiveWindow.ScrollColumn = 67
    ActiveWindow.ScrollColumn = 68
    ActiveWindow.ScrollColumn = 69
    ActiveWindow.ScrollColumn = 70
    ActiveWindow.ScrollColumn = 71
    ActiveWindow.ScrollColumn = 72
    ActiveWindow.ScrollColumn = 73
    ActiveWindow.ScrollColumn = 74
    ActiveWindow.ScrollColumn = 75
    ActiveWindow.ScrollColumn = 76
    ActiveWindow.ScrollColumn = 77
    ActiveWindow.ScrollColumn = 78
    ActiveWindow.ScrollColumn = 79
    ActiveWindow.ScrollColumn = 80
    ActiveWindow.ScrollColumn = 81
    ActiveWindow.ScrollColumn = 82
    ActiveWindow.ScrollColumn = 83
    ActiveWindow.ScrollColumn = 84
    ActiveWindow.ScrollColumn = 85
    Columns("H:CG").Select
    Selection.Delete Shift:=xlToLeft
    Range("K7").Select
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 10
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 14
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 19
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 19
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
    ActiveWindow.ScrollColumn = 2
    Range("H1").Select
    ActiveCell.FormulaR1C1 = "SUM"
    Range("H2").Select
    Application.CutCopyMode = False
    ActiveCell.Formula2R1C1 = "=RC[-7]:RC[-1]"
    Range("H2").Select
    Columns("H:H").EntireColumn.AutoFit
    Range("H2").Select
    ActiveCell.FormulaR1C1 = "=RC[-7]&RC[-6]&RC[-5]&RC[-4]&RC[-3]&RC[-2]&RC[-1]"
    Range("H2").Select
    Selection.AutoFill Destination:=Range("H2:H66")
    Range("H2:H66").Select
    Range("A1").Select
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 19
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 21
    ActiveWindow.ScrollColumn = 22
    ActiveWindow.ScrollColumn = 23
    ActiveWindow.ScrollColumn = 22
    ActiveWindow.ScrollColumn = 21
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 19
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 14
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 10
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 4
    Range("A1:H1").Select
    Selection.AutoFilter
    Columns("H:H").Select
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
    ActiveSheet.Range("$A$1:$H$66").AutoFilter Field:=1, Criteria1:="<>"
    ActiveWindow.ScrollColumn = 2
    Columns("H:H").Select
    ActiveSheet.Range("$A$1:$H$66").RemoveDuplicates Columns:=8, Header:=xlYes
    Range("G13").Select
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
End Sub
