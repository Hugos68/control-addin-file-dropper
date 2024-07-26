page 50103 "File Dropper"
{
    ApplicationArea = All;
    Caption = 'Files';
    PageType = ListPart;
    SourceTable = "Comment Line";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            usercontrol(FileDropper; FileDropper)
            {
                ApplicationArea = All;

                trigger OnDrop(filename: Text; data: Text)
                var
                begin
                    LineNo += 1;
                    rec."Line No." := LineNo;
                    rec.Comment := filename;
                    rec.Insert();
                end;

                trigger OnReady();
                begin
                    ControlIsReady := true;
                end;
            }
            repeater(RecordLinkList)
            {

                ShowCaption = false;
                field(File; Rec.Comment)
                {
                    ApplicationArea = All;
                    Caption = 'File';

                }
            }
        }
    }
    var
        ControlIsReady: Boolean;
        LineNo: integer;
}
