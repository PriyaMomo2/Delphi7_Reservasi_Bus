unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, ExtCtrls, jpeg;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit3, Unit2, Unit6;

{$R *.dfm}

procedure TForm5.Edit1Change(Sender: TObject);
begin
with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Text:='SELECT * FROM `t_user` where user='+quotedstr(edit1.Text);
      open;
    end;
end;

procedure TForm5.Button1Click(Sender: TObject);
begin
if ADOQuery1.RecordCount = 0 then
    begin
      showmessage('Identitas tidak ditemukan!');
      edit1.Text:='';
      edit1.SetFocus;
    End
  else if ADOQuery1.FieldByName('pass').AsString <> edit2.Text then
    begin
      showmessage('Password salah!');
      edit2.Text:='';
      edit1.SetFocus;
    end else
    begin
      form6.Show;
      form5.Hide;
    end;
end;

end.
