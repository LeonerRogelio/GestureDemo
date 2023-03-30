unit UMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls,
  FMX.Objects, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Gestures,
  FMX.Edit;

type
  TfrmMain = class(TForm)
    GestureManager1: TGestureManager;
    pnlMain: TPanel;
    memLog: TMemo;
    Circle1: TCircle;
    ImageControl1: TImage;
    btnClear: TButton;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    procedure pnlMainGesture(Sender: TObject;
      const EventInfo: TGestureEventInfo; var Handled: Boolean);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}

// Limpiar el memo
procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  memLog.Lines.Clear;
end;

{ Responder al gesto realizado. Cuando realizar un gesto, en el se registra el identificador del gesto que
  se recibió, en este caso los gestos implementados son, movimiento a la: izquierda, derecha, arriba y abajo }
procedure TfrmMain.pnlMainGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);

var
  S: string;
begin
  if GestureToIdent(EventInfo.GestureID, S) then
    Handled := true;

  memLog.Lines.Add(Format('GestureID = %D, <%s>', [EventInfo.GestureID, S]));
end;

end.
